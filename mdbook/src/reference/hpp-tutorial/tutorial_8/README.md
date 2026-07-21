# Pick and place with gripper, introducing pre and post-actions

## Prerequisite

Having completed [tutorial 7](../tutorial_7/).

## Overview

Tutorial 6 executed one arm trajectory with `send_trajectory`. This tutorial
adds the gripper: the robot must open the fingers before approaching the box,
close them before transport, then open them again at the goal.

The script plans a pick-and-place path with an HPP manipulation constraint
graph. We then use `hpp_exec` to expose the graph segments, attach the Gazebo
actions for this problem, and execute the segments.

For the full `hpp_exec` API, see the
[hpp-exec documentation](https://gepetto.github.io/doc/hpp-exec/doxygen-html/index.html).

## Setting up the simulation

Use the same Docker image as tutorial 6 (`hpp-ros2:tuto`). If you have not
built it yet, see the [tutorial 6 instructions](../tutorial_6/).

## Terminal 1: Launching the simulation

Launch Gazebo with the FR3 and its gripper:

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
cd ~/devel/src/hpp_tutorial/tutorial_7
python -i init.py
```

The script loads the FR3, the ground, and a box. It solves a pick-and-place
problem that moves the box from `(0.4, -0.2)` to `(0.4, 0.2)`, optimizes the
path, time-parameterizes it with `SimpleTimeParameterization`.

Note that between optimization and time parameterization, an object called `EnforceTransitionSemantic` is called. This steps labels each sub-path with the transition of the graph the sub-path belongs to. This step is necessary before executing the path in order to place pre-actions and post-actions at the right times.

You can visualize the planned path in the browser viewer:

```python
v = display()
v.loadPath(p_timed)
```

## Defining gripper actions

Create the actions that will be called during execution:

```python
from hpp_exec import send_trajectory


def attach_box():
    attach_pub.publish(Empty())
    rclpy.spin_once(gazebo_node, timeout_sec=0.05)
    time.sleep(0.2)
    gazebo_node.get_logger().info("Published '/box/attach' on Gazebo topic")
    return True


def detach_box():
    detach_pub.publish(Empty())
    rclpy.spin_once(gazebo_node, timeout_sec=0.05)
    time.sleep(0.2)
    gazebo_node.get_logger().info("Published '/box/detach' on Gazebo topic")
    return True


def open_gripper():
    return send_trajectory(
        [np.array([0.0]), np.array([0.035])],
        [0.0, 0.5],
        joint_names=GRIPPER_JOINT_NAMES,
        controller_topic="/gripper_controller/follow_joint_trajectory",
    )


def close_gripper():
    return send_trajectory(
        [np.array([0.035]), np.array([0.0])],
        [0.0, 0.5],
        joint_names=GRIPPER_JOINT_NAMES,
        controller_topic="/gripper_controller/follow_joint_trajectory",
    )


def grasp_box():
    return attach_box() and close_gripper()


def release_box():
    return open_gripper() and detach_box()
```

`open_gripper` and `close_gripper` send a reference value for
`fr3_finger_joint1` to open or close the gripper. They use `send_trajectory`,
as in `tutorial_6`. On the real robot, this would be performed by a ROS action
instead.

`grasp_box` and `release_box` call `attach_box` and `detach_box` respectively.
These functions tell Gazebo that the box is attached to or detached from the
end effector.


At this point the useful objects are:

- `p_timed`: the time-parameterized HPP path.
- `configs`: sampled HPP configurations along the timed path.
- `times`: timestamps in seconds, returned by `segments_from_graph`.
- `segments`: graph segments where you can add pre/post actions.
- `graph`: the HPP manipulation constraint graph.
- `open_gripper`, `close_gripper`, `grasp_box`, and `release_box`: Gazebo
  actions for the gripper and simulated box attachment.

## Building execution segments

The planned path contains the approach, transport, and retreat motion in one
path. Ask `hpp_exec` to sample the timed path and expose the HPP graph
segments:

```python
from hpp_exec import segments_by_transition, print_segments, segments_from_graph

configs, times, segments = segments_from_graph(p_timed, graph)
print_segments(segments)
```

The table shows the segment times, graph transition names, nominal states,
observed states, and how many pre/post actions are attached.

Build a transition-name map and attach the actions to the movements used in
this tutorial:

```python
GRASP_TRANSITION = "fr3/gripper > box/handle | f_23"
RELEASE_TRANSITION = "fr3/gripper < box/handle | 0-0_21"

segments_by_name = segments_by_transition(segments)

segments[0].pre_actions.append(open_gripper)
for segment in segments_by_name[GRASP_TRANSITION]:
    segment.pre_actions.append(grasp_box)
for segment in segments_by_name[RELEASE_TRANSITION]:
    segment.pre_actions.append(release_box)

print_segments(segments)
```

`segments_by_transition` is a dictionary that stores the segments by the transition they belong to. This is very convenient to assign pre or post-actions to each segment.
Conceptually, execution has three phases:

| # | Phase     | What the arm does           | Action before phase |
|---|-----------|-----------------------------|---------------------|
| 0 | approach  | move above the box, descend | open                |
| 1 | transport | carry the box to the goal   | attach and close    |
| 2 | retreat   | lift and return             | open and detach     |

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
)
```

You should see the fingers open, the arm descend, the fingers close on the
box, the arm carry the box to the goal, the fingers open, and the arm retreat.

`reset_box_pose()` detaches the simulated box if needed and places it back at
the planned start pose before execution.
