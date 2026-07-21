# hpp-exec

ROS2 execution utilities for HPP-generated trajectories.

## Overview

You write your HPP planning script using `pyhpp` directly, then use `hpp_exec` to send the trajectory to `ros2_control`.

## Tutorials

The official tutorials for this package are in [hpp-tutorial](https://github.com/humanoid-path-planner/hpp-tutorial):

- **Tutorial 6**: Plan a simple arm motion and execute on Gazebo via `send_trajectory()`
- **Tutorial 7**: Pick-and-place with graph segments, gripper actions, and `execute_segments()`
- **Tutorial 8**: Pick-and-place while opening the gripper during arm travel

## Documentation

- [Generated Doxygen documentation](https://gepetto.github.io/doc/hpp-exec/doxygen-html/index.html):
  user reference for the API, execution model, and troubleshooting.

## Creating configs and times from HPP

After planning and time parameterization with HPP, you have a `Path` object that maps time (seconds) to robot configurations. For a plain arm trajectory, sample it at regular intervals to get configs:

```python
import numpy as np
from pyhpp.core import TrapezoidalTimeParameterization

# After solving:
# path = planner.solve()
optimizer = TrapezoidalTimeParameterization(problem)
optimizer.maxVelocity = 0.5
optimizer.maxAcceleration = 0.5
p_timed = optimizer.optimize(path)

n_samples = 50
configs = []
times = []

for i in range(n_samples + 1):
    t = (i / n_samples) * p_timed.length()
    q, success = p_timed(t)
    if success:
        configs.append(np.array(q))
        times.append(t)

# configs: List[np.ndarray] - configuration vectors at each sample
# times: List[float] - timestamps in seconds
```

The HPP configuration vector typically includes all robot DOFs. Use `joint_indices` to select which joints to send to ros2_control (e.g., arm joints only, excluding fingers).

## Sending to ros2_control

```python
from hpp_exec import send_trajectory

send_trajectory(
    configs, times,
    joint_names=["joint1", "joint2", ...],  # ROS2 joint names
    joint_indices=list(range(7)),            # Which HPP config indices to use
)
```

## Installation

### Docker (recommended)

```bash
cd hpp-exec
./run.sh

# First time inside container:
cd ~/devel/src && make all
```

### API

```python
from hpp_exec import (
    BackgroundAction,
    Segment,
    execute_segments,
    read_current_configuration,
    segments_by_transition,
    print_segments,
    send_trajectory,
    segments_from_graph,
)

# Main function - send trajectory to ros2_control
send_trajectory(
    configs,              # List[np.ndarray] from HPP
    times,                # List[float] timestamps in seconds
    joint_names,            # List[str] ROS2 joint names
    controller_topic="...", # FollowJointTrajectory action topic
)

# Expose the HPP graph segments.
configs, times, segments = segments_from_graph(path, graph)
print_segments(segments)

# Inspect every occurrence of each graph transition.
segments_by_name = segments_by_transition(segments)
segments_by_name["fr3/gripper > box/handle | f_23"][0].pre_actions.append(grasp_box)
segments_by_name["fr3/gripper < box/handle | 0-0_21"][0].pre_actions.append(
    release_box
)

# Or overlap a blocking action with the next segment's arm motion.
background_open = BackgroundAction(open_gripper, name="open_gripper")
segments[0].pre_actions.append(background_open.start)
segments[2].pre_actions.append(background_open.wait)
segments[2].pre_actions.append(close_gripper)

execute_segments(
    segments,
    configs,
    times,
    joint_names,
)

# Dictionary API: instead of the manual appends above, leave segments
# unchanged and attach actions by graph transition name when starting execution.
# This applies each action to every segment with that transition name.
pre_actions = {
    "fr3/gripper > box/handle | f_23": [grasp_box],
}
post_actions = {
    "fr3/gripper < box/handle | 0-0_21": [release_box],
}

execute_segments(
    segments,
    configs,
    times,
    joint_names,
    pre_actions_by_transition=pre_actions,
    post_actions_by_transition=post_actions,
)

# Read the robot state before planning from the live position.
q_start = read_current_configuration(
    node,
    joint_names=["joint1", "joint2", ...],
    topic="/joint_states",
)
```

See the generated Doxygen documentation for `send_trajectory_async()`,
`configs_to_joint_trajectory()`, and other lower-level helpers.

## Tutorials

The maintained end-to-end examples live in `hpp_tutorial`.

```bash
cd ~/devel/src/hpp_tutorial/tutorial_6
python -i init.py
```

See tutorial 6 for simple arm execution, tutorial 7 for pick-and-place with
graph segments, and tutorial 8 for overlapping a gripper action with arm
travel.

## Structure

```
hpp-exec/
|-- hpp_exec/           # Python package
|   |-- __init__.py
|   |-- actions.py         # Reusable helpers for segment actions
|   |-- joint_state.py     # Read JointState messages as ordered configs
|   |-- segments.py        # Segment data structure
|   |-- trajectory_utils.py # HPP config to ROS2 JointTrajectory conversion
|   |-- ros2_sender.py     # send_trajectory() via FollowJointTrajectory action
|   `-- graph_segments.py         # Graph segment extraction and display
|-- scripts/               # Launch scripts for Gazebo
|-- robots/                # URDF/SRDF assets
|-- docker/
|-- Dockerfile
`-- run.sh
```

## License

BSD-2-Clause
