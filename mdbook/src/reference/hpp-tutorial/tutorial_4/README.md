# How to control the trajectory of a tool.

## Prerequisite

Having completed [tutorial 3](../tutorial_3/)

## Initializing the problem

In the docker container, cd into `tutorial_4` directory. In a bash terminal, run

```
python -i init.py
```
The script contains the code of [tutorial_3](../tutorial/tutorial_3) up to the computation of
a path to `qpg`. To plan a path between `qpg` and qg, we first generate a desired trajectory
of the tooltip.

```
from pyhpp.constraints import (ComparisonType, ComparisonTypes)

gripper = robot.grippers()["staubli/tooltip"]
trajConstraint = handle.createGrasp(gripper, "drilling")
cts = ComparisonTypes()
cts[:] = 6*[ComparisonType.Equality]
trajConstraint.comparisonType(cts)
init = trajConstraint.function()(qpg)
goal = np.array([0,0,0,0,0,0,1])
```
The code above create a relative pose contraint between the gripper (tooltip) and the handle.
The value of the constraint in SE(3) is the pose of the handle in the frame of the gripper.
`init` is the value of the function in `qpg`. As an element of SE(3), it is not a vector.
```
print(init.space())
```
As shown in the python terminal, it is an element of R^3^ x SO(3) (equivalent to SE(3)).
We can access to the vector representation as follows:
```
print(init.vector())
```
As expected, this corresponds to the pose of the handle in the gripper frame in configuration `qpg`:
 a translation of 10cm along z.

See documentation of class `hpp::pinocchio::LiegroupSpace` for more information.

```
from pyhpp.manipulation.steering_method import (Cartesian, makePiecewiseLinearTrajectory)

weights = 50*np.ones(6)
points = np.zeros(14).reshape((2,7))
points[0:] = init.vector()
points[1:] = goal
rhs = makePiecewiseLinearTrajectory(points, weights)
```
The above code creates a straight path in SE(3) from the initial pose of the gripper to the
handle. The duration of the path is tuned by a vector of weights as described in the
documentation of method
`hpp::manipulation::steeringMethod::Cartesian::makePiecewiseLinearTrajectory`.
```
cartesian = Cartesian(planner.innerProblem())
cartesian.trajectoryConstraint = trajConstraint
cartesian.setRightHandSide(rhs, True)
res, p2 = cartesian.planPath(qpg)
```
The trajectory constraint as well as the time-varying right hand side are passed to the
`Cartesian` steering method and a path is computed.
```
transition = graph.getTransition("staubli/tooltip > plate/hole | f_12")
pv = transition.pathValidation()
res, p3, report = pv.validate(p2, False)
```
The path is then tested for collision after setting the relevant security margins.

[Tutorial 5](../tutorial_5/) shows how to optimize and time-parameterize paths.
