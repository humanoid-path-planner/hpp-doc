# `pyhpp.manipulation.steering_method`

## `Cartesian`

> Build a robot trajectory from an end-effector trajectory
>
> This class does not derive from SteeringMethod  since it does not link two configurations by a path. Instead, it only takes an initial configuration and a trajectory of an end-effector.
>
> To use this class, the user needs to provide
>
> a constraint with value in $SE(3)$. An easy way to create such a constraint is to use method hpp::manipulation::Handle::createGrasp. The constraint is passed to this class using method trajectoryConstraint .
>
> the time-varying right hand side of this constraint along the path the user wants to create in the form of a hpp::core::Path instance with values in $SE(3)$. For that, makePiecewiseLinearTrajectory  method may be useful.
>
> Once the steering method has been initialized, it can be called with and initial configuration q_init. The interval of definition $[0,T]$ of the output path is the same as the one of the path provided as the right hand side of the constraint. Note that q_init should satisfy the constraint at times 0.

| Method | Description |
|:---|:---|
| `getRightHandSide` | Get right hand side function of trajectory constraint. |
| `planPath` | Plan a path starting from an initial configuration. <br> **q_init** — initial configuration <br> **Returns** — (success, result) where <br> result is the resulting path in case of success, a valid portion of path satisfying <br> the trajectory constraint along a sub-interval starting at 0 otherwise. <br> The successive steps of the computations are the following. <br> The interval of definition is discretized into a number of sub-intervals defined by <br> method link Cartesian::nDiscreteSteps <br> nDiscreteStepsndlink. For each discretized value, a configuration is computed by <br> projecting the previous one onto the time-varying constraint or the initial <br> configuration for the first discretized value. <br> the path interpolating these configurations and associated to the time-varying <br> constraint is tested for collision. If no collision is detected, the function <br> returns true. <br> In case of failure in the first step, the interpolated path until the last successful <br> projection is returned without collision checking. <br> In case of failure in the second step, a collision-free path defined over a sub-interval <br> starting at 0 and satisfying the constraints is returned. |
| `setRightHandSide` | Set right hand side from a hpp::core::Path <br> **rhs** — function from an interval to SE(3). <br> **se3Output** — set to True if the output of path must be understood as SE3. |
| `setRightHandSide` | Set right hand side from a hpp:constraints::DifferentiableFunction <br> :param rhs function. <br> :param timeRange interval of definition of the function. |
| `timeRange` | Get interval of definition of right hand side of trajectory constraint. |
| `errorThreshold` *(property)* | Error threshold of numerical solver. |
| `maxIterations` *(property)* | Maximal number of iterations of numerical solver. |
| `nDiscreteSteps` *(property)* | Number of discretization steps in the interval of definition <br> where configurations are computed. |
| `trajectoryConstraint` *(property)* | Constraint with a time-varying right hand side. |

---

## Functions

| Function | Description |
|:---|:---|
| `makePiecewiseLinearTrajectory()` | Build a piecewise linear path. <br> See C++ documentation of class hpp::manipulation::steeringMethod::Cartesian. |
