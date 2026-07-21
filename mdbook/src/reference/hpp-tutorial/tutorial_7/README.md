# How to execute motions on a simulated robot.

## Prerequisite

Having completed [tutorial 6](../tutorial_6/).

## Overview

This tutorial plans a simple arm motion for the Franka FR3 robot and executes it
on a Gazebo simulation via ROS2. It introduces the `hpp_exec` package which
bridges HPP paths to `ros2_control`.


## Terminal 1: Launching the simulation

Launch the Gazebo simulation with
a `joint_trajectory_controller`:

```
ros2 launch hpp_tutorial tutorial_6_launch.py
```

Wait until you see `Configured and activated joint_trajectory_controller` in the
output.

## Terminal 2: Planning and executing

Open a second terminal:

```
docker exec -it hpp bash
```

Source the environments and run the tutorial script:

```
cd ~/devel/src/hpp_tutorial/tutorial_6
python -i init.py
```

The script loads the FR3 robot, plans a motion from the current robot
configuration to a goal configuration using BiRRT, optimizes it with
RandomShortcut, and applies time parameterization using
SimpleTimeParameterization (as seen in tutorial 5).

You can visualize the planned path in the browser viewer:
```python
v = display()
v.loadPath(p_timed)
```

## Understanding the trajectory

After time parameterization, `p_timed` is a continuous function mapping time (in
seconds) to robot configurations. To send it to ros2_control, we need discrete
waypoints.

Check the trajectory duration:
```python
print(f"Trajectory duration: {p_timed.length():.2f} seconds")
```

Sample a configuration at a specific time (e.g., t=1.0s):
```python
q, success = p_timed(1.0)
print(f"Config at t=1.0s: {q}")  # First 7 values are arm joints
```

The HPP configuration vector has 9 elements: 7 arm joints + 2 finger joints.

## Extracting waypoints

To execute the trajectory, we sample it at regular intervals. Try extracting
waypoints yourself:

```python
import numpy as np

n_samples = 50
configs = []
times = []

for i in range(n_samples + 1):
    t = (i / n_samples) * p_timed.length()
    q, success = p_timed(t)
    assert(success)
    configs.append(np.array(q))
    times.append(t)

print(f"Extracted {len(configs)} waypoints over {times[-1]:.2f} seconds")
```

## Sending the trajectory

Now send the waypoints to Gazebo via ros2_control:

```python
from hpp_exec import send_trajectory

send_trajectory(
    configs, times,
    joint_names=[f'fr3_joint{i}' for i in range(1, 8)],
    joint_indices=list(range(7)),
)
```

- `joint_names`: The ROS2 joint names expected by the controller.
- `joint_indices`: Which elements of the HPP config to send (indices 0-6 are the
  arm joints; we skip indices 7-8 which are the fingers).

You should see the robot move in Gazebo and `Trajectory execution complete` in
the terminal.

## Experiment

Try different values of `n_samples` (e.g., 10, 100, 200) and observe how it
affects the smoothness of motion in Gazebo.

You can also play the reverse motion using
```
p_reversed = p_timed.reverse()
```
