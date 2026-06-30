# How to use HPP in manufacturing.

## Prerequisite

Having installed HPP by following the steps described in [tutorial 1](../tutorial_1/).

## Introduction

In many manufacturing applications, we often need to bring a tool mounted on a robot end effector to a predefined pose with respect to a part. This tutorial shows how to use the same concepts as in [tutorial 2](../tutorial_2/) to perform a simplified drilling task.

## Initializing the problem

In the docker container, cd into `tutorial_3` directory. In a bash terminal, run

```
python -i init.py
```

to load the models and initialize the path planning problem. The script is similar to tutorial_2 example, except that

  - the robot is a Stäubli TX2-90 holding a drill,
  - the object is a vertical square plate,
  - a function `display()` creates and initializes the viewer client,
  - a handle is added to the object via python and not via the SRDF file.

The handle is created and added by the following lines
```
# Add a handle on the plate
R = np.array([[ 0, 0, 1],
              [ 0, 1, 0],
              [-1, 0, 0]])
T = np.array([0.02, 0, 0])
pose = SE3(rotation = R, translation = T)
robot.addHandle("plate/base_link", "plate/hole", pose, 0.1, 6*[True])
handle = robot.handles()["plate/hole"]
handle.approachingDirection = np.array([0, 0, 1])
```
the pose of the handle in the link frame is provided by an object of type `SE3` from `pinocchio` module, initialized by a rotation matrix and a translation vector. Note that the link name and the handle names are prefixed by the name of the object that holds the handle: `"plate/base_link", "plate/hole"`. Parameter `0.1` is the handle clearance.

The code above is equivalent to the following lines in an SRDF file:
```
  <handle name="hole" clearance="0.1" approaching_direction="0 0 1">
    <position xyz="0.02 0 0" rpy="0 1.5707963267948966 0" />
    <link name="base_link"/>
  </handle>
```

## Creating waypoint configurations

To plan a drilling motion, we will proceed in several steps:
  1. generate a "pregrasp" (qpg) and a "grasp" (qg) configurations,
  2. plan motions between q_init and qpg, then plan a motion between qpg and qg.

For step 1, first copy paste the following code into the python terminal:
```
# Generate configuration in pregrasp reachable from q_init and in grasp reachable from pregrasp
transition = graph.getTransition("staubli/tooltip > plate/hole | f_01")
pv = transition.pathValidation()
res, qpg, err = graph.generateTargetConfig(transition, q_init, q_init) # -> failure
if not res:
    print ("Failed to project q_init to pregrasp waypoint state")
```
The above code tries to project configuration `q_init` to the pregrasp waypoint state "staubli/tooltip > plate/hole | f_pregrasp". Method `graph.generateTargetConfig` uses a solver containing the constraints of transition "staubli/tooltip > plate/hole | f_01" and of the target state "staubli/tooltip > plate/hole | f_pregrasp". In this case the constraints are
  - Locked joint "plate/root_joint",
  - staubli/tooltip pregrasps plate/hole.

The right hand side of the first one is initialized with `q_init` (second argument). This simply means that the part shoud be in the same pose as in `q_init`. The second one is a constraint of relative pose between the gripper and the handle: both frames should have the same orientation and the position of the center of the handle in the gripper frame is the product of the sum of gripper and handle clearances by the approaching direction vector. As state above, the solver is initialized with `q_init` (third argument). The output of the function is composed of
  - `res`: `True` if the solver succeeded, `False` otherwise,
  - `qpg`: the result configuration or the last iteration of the solver in case of failure,
  - `err`: the norm of the residual.

Note that projection fails, this does not mean that the constraints have no solution. Initializing the solver with another configuration may succeed.

Copy paste now the code below in the python terminal.
```
for i in range(1000):
    transition = graph.getTransition("staubli/tooltip > plate/hole | f_01")
    q = shooter.shoot()
    res, qpg, err = graph.generateTargetConfig(transition, q_init, q)
    if not res: continue
    res, report = pv.validateConfiguration(qpg)
    if not res: continue
    transition = graph.getTransition("staubli/tooltip > plate/hole | f_12")
    res, qg, err = graph.generateTargetConfig(transition, qpg, qpg)
    if res: break

# Notice that qg is in collision
res, report = pv.validateConfiguration(qg)
print(report)
```
The code above tries to generate a pregrasp and a grasp configurations by initializing the pregrasp
solver with a random configuration and the grasp solver with the pregrasp configuration. The pregrasp configuration is tested for collision. If a projection fails or a collision occurs, the loop restart with another random configuration. Note that the grasp configuration is produced by initializing the solver (second call to `graph.generateTargetConfig`) with the pregrasp configuration. This is necessary to make sure that the latter is close to the former and that the robot does not need a long reconfiguration motion to reach grasp from pregrasp.

You can visualize `qpg` and `qg` in the graphical interface as follows.
```
v = display()
v(q_init)
v(qpg)
v(qg)
```

## Using security margins

In the previous example, the grasp configuration is in collision since the tool is inside the part. We need to deactivate collision checking between the end-effector and the part on the second part of the motion (transition "staubli/tooltip > plate/hole | f_12"). For that, we will use a python class to handle security margins.

A security margin is a distance below which two objects are considered as colliding. By extension,
  - a negative security margin means that penetration is allowed
  - -Inf security margin means that the object are never considered as colliding.

Path and configurations are checked for collisions by `PathValidation` instances. Each transition of the constraint graph owns a PathValidation (`hpp::core::ContinuousValidation`) instance. Security margins can be defined between pairs of joints by a square matrix of size the number of joints. The value in a cell corresponds to the security margin between the joints corresponding to the row and column indices of the cell. the indices are those in the list returned by
```
robot.getJointNames()
```
The code below sets security margins between robots (as set of joints). Copy paste the code in the python terminal
```
# Defining security margins
from pyhpp.manipulation.security_margins import SecurityMargins
sm = SecurityMargins(problem,factory, ["staubli", "plate"], robot)
sm.setSecurityMarginBetween("staubli", "plate", 0.05)
sm.apply()
```
Then, if you type
```
M = graph.getSecurityMarginMatrixForTransition(transition)
print(np.array(M))
```
you should see
```
[[0.   0.   0.   0.   0.   0.   0.   0.  ]
 [0.   0.   0.   0.   0.   0.   0.   0.05]
 [0.   0.   0.   0.   0.   0.   0.   0.05]
 [0.   0.   0.   0.   0.   0.   0.   0.05]
 [0.   0.   0.   0.   0.   0.   0.   0.05]
 [0.   0.   0.   0.   0.   0.   0.   0.05]
 [0.   0.   0.   0.   0.   0.   0.   0.05]
 [0.   0.05 0.05 0.05 0.05 0.05 0.05 0.  ]]
```
and notice that between each joint of the robot and the plate, the security margin is 0.05.

The following code deactivates collision checking between the robot end effector and the plate along a transition.
```
transition = graph.getTransition("staubli/tooltip > plate/hole | f_12")
graph.setSecurityMarginForTransition(transition, "staubli/joint_6", "plate/root_joint",
                                     float("-inf"))
```
Copy paste this code and display again the security margin matrix.

After modifying the graph, we need to reinitialize it.
```
graph.initialize()
```
We can now generate collision free pregrasp and grasp configurations.
```
# Generate configuration in pregrasp reachable from q_init and in grasp reachable from pregrasp
# and test collision for both.
for i in range(1000):
    # Project random configuration on pregrasp waypoint state
    transition = graph.getTransition("staubli/tooltip > plate/hole | f_01")
    q = shooter.shoot()
    res, qpg, err = graph.generateTargetConfig(transition, q_init, q)
    if not res: continue
    # Check the configuration for collision
    pv = transition.pathValidation()
    res, report = pv.validateConfiguration(qpg)
    if not res: continue
    # Project pregrasp configuration on grasp state
    transition = graph.getTransition("staubli/tooltip > plate/hole | f_12")
    res, qg, err = graph.generateTargetConfig(transition, qpg, qpg)
    if not res: continue
    # Check the configuration for collision
    pv = transition.pathValidation()
    res, report = pv.validateConfiguration(qg)
    if res: break
```
You can visualize `qpg` and `qg` in the graphical interface.

## Planning motions between the waypoint configurations

![Waypoint configurations `q_init`, `qpg`, `qg` in their respective states.](figures/constraint-graph.svg)

We now need to plan a motion between `q_init` and `qpg` and between `qpg` and `qg`, keeping the relevant constraints satisfied. Here the only relevant constraint is that the part should not move. To do so, we will use the `TransitionPlanner` class. This class plans motions along a transition, keeping the constraints of the transition satisfied. The right hand side of the parameterizable constraints of the transition is initialized with the initial configuration. The code below shows how to use this class.
```
from pyhpp.manipulation import TransitionPlanner
planner = TransitionPlanner(problem)
planner.maxIterations(1000)
for i in range(10):
    # Project random configuration on pregrasp waypoint state
    transition = graph.getTransition("staubli/tooltip > plate/hole | f_01")
    q = shooter.shoot()
    res, qpg, err = graph.generateTargetConfig(transition, q_init, q)
    if not res: continue
    # Check the configuration for collision
    pv = transition.pathValidation()
    res, report = pv.validateConfiguration(qpg)
    if not res: continue
    # plan motion between q_init and qpg
    planner.setTransition(transition)
    try:
        q_goal = np.zeros((robot.configSize(), 1))
        q_goal[:,0] = qpg
        p1 = planner.computePath(q_init, q_goal, True)
    except Exception as exc:
        print(f"path planning failed between q_init and qpg: {exc}")
        continue
    # Project pregrasp configuration on grasp state
    transition = graph.getTransition("staubli/tooltip > plate/hole | f_12")
    res, qg, err = graph.generateTargetConfig(transition, qpg, qpg)
    if not res: continue
    # Check the configuration for collision
    pv = transition.pathValidation()
    res, report = pv.validateConfiguration(qg)
    if not res: continue
    # plan motion between qpg and qg
    planner.setTransition(transition)
    try:
        q_goal = np.zeros((robot.configSize(), 1))
        q_goal[:,0] = qg
        p2 = planner.computePath(qpg, q_goal, True)
    except Exception as exc:
        print(f"path planning failed between qpg and qg: {exc}")
        continue
    if p2:
        p3 = p2.reverse()
        break
```
You can now load paths `p1`, `p2`, `p3` in the graphical interface and play them.
```
v.loadPath(p1)
v.loadPath(p2)
v.loadPath(p3)
```
The drilling path is a little bit naive since the tool trajectory is not a straight line but the result of an interpolation in joint space and the velocities of the robot and tool are not controlled.

[Tutorial 4](../tutorial_4/) shows how to better control a tool trajectory.
