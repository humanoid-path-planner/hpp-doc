# A more efficient way to assign pre or post-actions

## Prerequisite

Having completed [tutorial 8](../tutorial_8/).

## Overview

Tutorial 7 opens the gripper as a blocking pre-action before the approach
motion. This tutorial uses `hpp_exec.BackgroundAction` to start opening the
gripper in the background, let the arm begin travelling, then wait for the
opening action just before grasping the box.

The planning problem, Gazebo setup, and pick-and-place path are the same as in
tutorial 7. Only the execution actions change.

For the full `hpp_exec` API, see the
[hpp-exec documentation](https://gepetto.github.io/doc/hpp-exec/doxygen-html/index.html).

## Setting up the simulation

Use the same Docker image as tutorial 6 (`hpp-ros2:tuto`). If you have not
built it yet, see the [tutorial 6 instructions](../tutorial_6/).

## Terminal 1: Launching the simulation

Launch the same FR3 and gripper simulation as tutorial 7:

```
ros2 launch hpp_tutorial tutorial_7_launch.py
```

Wait until you see `Configured and activated gripper_controller` in the output.

Note: one gripper finger may appear loose in Gazebo. This is a simulation
artefact with mimic joints. It does not affect the tutorial.

## Terminal 2: Planning

Open a second terminal:

```
docker exec -it hpp bash
```

Run the tutorial script:

```
cd ~/devel/src/hpp_tutorial/tutorial_8
python -i init.py
```

The script loads the FR3, the ground, and a box. It solves the same
pick-and-place problem as tutorial 7, optimizes the path, enforces transition
semantics, and time-parameterizes it with `SimpleTimeParameterization`.

You can visualize the planned path in the browser viewer:

```python
v = display()
v.loadPath(p_timed)
```

At this point the useful objects are:

- `p_timed`: the time-parameterized HPP path.
- `configs`: sampled HPP configurations along the timed path.
- `times`: timestamps in seconds, returned by `segments_from_graph`.
- `segments`: graph segments whose `transition_name` values can be used as
  action dictionary keys.
- `graph`: the HPP manipulation constraint graph.
- `open_gripper`, `close_gripper`, `grasp_box`, and `release_box`: Gazebo
  actions for the gripper and simulated box attachment.

## Building execution dictionaries

The planned path contains the approach, transport, and retreat motion in one
path. Ask `hpp_exec` to sample the timed path and expose the HPP graph
segments:

```python
from hpp_exec import segments_by_transition, print_segments, segments_from_graph

configs, times, segments = segments_from_graph(p_timed, graph)
print_segments(segments)
```

This tutorial attaches actions by graph transition name. First wrap the opening
action so it can run while the arm starts moving:

```python
from hpp_exec import BackgroundAction

background_open_gripper = BackgroundAction(open_gripper, name="open_gripper")
```

Set the transition names where the action dictionaries should apply, then
check how many path occurrences use each transition:

```python
APPROACH_TRANSITION = "Loop | f"
GRASP_TRANSITION = "fr3/gripper > box/handle | f_23"
RELEASE_TRANSITION = "fr3/gripper < box/handle | 0-0_21"

segments_by_name = segments_by_transition(segments)
```

Now fill the pre-action and post-action dictionaries. The keys are exact
transition names, and the values are callables. A dictionary entry
applies to every segment with that transition name, so check the printed table
and the occurrence counts before executing. In this movement, each transition
used below appears once. If a different movement repeats one of these names,
the dictionary action would run for every occurrence; use
`segments_by_name[TRANSITION_NAME][i].pre_actions` when you need to attach an
action to one chosen occurrence.

```python
pre_actions_by_transition = {
    APPROACH_TRANSITION: [background_open_gripper.start],
    GRASP_TRANSITION: [background_open_gripper.wait, grasp_box],
    RELEASE_TRANSITION: [release_box],
}
post_actions_by_transition = {}
```

The resulting schedule is:

| Dictionary | Transition | Action                         | Effect                          |
|------------|------------|--------------------------------|---------------------------------|
| pre        | approach   | `background_open_gripper.start` | start opening in the background |
| pre        | grasp      | `background_open_gripper.wait`  | wait until opening has finished |
| pre        | grasp      | `grasp_box`                    | attach the box and close fingers |
| pre        | release    | `release_box`                  | open fingers and detach the box |

Conceptually, execution still has three phases:

| # | Phase     | What the arm does           | Action before phase |
|---|-----------|-----------------------------|---------------------|
| 0 | approach  | move above the box, descend | start opening       |
| 1 | transport | carry the box to the goal   | wait, attach, close |
| 2 | retreat   | lift and return             | open and detach     |

`background_open_gripper.start()` returns immediately, so the arm can begin the
approach while the gripper controller opens the fingers. The later
`background_open_gripper.wait()` blocks before the grasp transition, and
`grasp_box()` runs after that segment so the fingers close once the arm has
reached the object. If a dictionary key does not match any segment transition,
`execute_segments` returns `False` before running any action or trajectory.

## Executing the segments

Send the arm segments to the arm controller and let the segment actions command
the gripper controller:

```python
from hpp_exec import execute_segments

close_gripper()
reset_box_pose()
execute_segments(
    segments, configs, times,
    joint_names=[f"fr3_joint{i}" for i in range(1, 8)],
    joint_indices=list(range(7)),
    pre_actions_by_transition=pre_actions_by_transition,
    post_actions_by_transition=post_actions_by_transition,
)
```

`close_gripper()` is only a setup step to make the overlapping opening visible
in Gazebo. During execution you should see the fingers open while the arm
starts the approach, then the plan waits before grasping, closes on the box,
carries it to the goal, opens again, and retreats.

`reset_box_pose()` detaches the simulated box if needed and places it back at
the planned start pose before execution.
