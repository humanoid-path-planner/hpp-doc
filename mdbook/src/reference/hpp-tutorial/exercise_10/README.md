# Exercise 10: MFJA pick and place

## Objective

The objective of this exercise is to use the notions explained in the various tutorials in order
to plan and execute manipulation motions of increasing complexity.

## Instructions

  1. In script pick_and_place.py, fill in with the appropriate python code the parts
     designated by comment `#TODO:`

  2. in a script called `pick_and_place_execute_without_actions.py`, write the code necessary
     to execute the planned motion without controlling the gripper. For that, take inspiration from
     tutorial_7.

  3. In a script called `pick_and_place_execute_with_actions.py`, write the code necessary to
     execute the planned motion with appropriate control of the gripper. You will need the
     following methods:

```python
    from staubli_io import set_gripper

    def open_gripper():
        return set_gripper(node, execution_config, "open")

    def close_gripper():
        return set_gripper(node, execution_config, "close")

```

## Run on the Stäubli

After completing the execution scripts above, start `ros_server` on the CS9
controller from the teach pendant. Check the cell, tool and gear placement with
the instructor before running the motion.

The following commands use the HPP/MFJA installation in `~/mfja-gears`.
Load the same environment and use ROS domain 7 in both terminals.
The Stäubli controller IP address is `172.31.0.1`.

In terminal 1, start the robot driver and gripper IO:

```bash
source "$HOME/mfja-gears/setup.bash"
export ROS_DOMAIN_ID=7
ros2 launch mfja_staubli_manipulation_demos room_315_staubli_hardware.launch.py \
  robot_ip:=172.31.0.1 \
  joint_config:="$MFJA_ROOT/installation/staubli_gears.yaml" \
  enable_io:=true
```

Keep this terminal running. In terminal 2, enter the exercise directory:

```bash
source "$HOME/mfja-gears/setup.bash"
export ROS_DOMAIN_ID=7
cd "$HPP_TUTORIAL_DIR/exercise_10"
```

For the arm-only exercise, leave the gripper open and empty and remove the gear:

```bash
python pick_and_place_execute_without_actions.py
```

For the pick-and-place exercise with gripper actions, place the gear at
`gear_plate/placement_1` and leave the gripper empty:

```bash
python pick_and_place_execute_with_actions.py
```
