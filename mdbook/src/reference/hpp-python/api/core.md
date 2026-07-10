# `pyhpp.core`

## `CollisionPathValidationReport`

*Inherits: `CollisionValidationReport`*  *Not instantiable from Python.*

> hpp::core::CollisionPathValidationReport

---

## `CollisionValidationReport`

*Inherits: `ValidationReport`*  *Not instantiable from Python.*

> hpp::core::CollisionValidationReport

---

## `ConfigProjector`

*Inherits: `Constraint`*

> Implicit non-linear constraint
>
> This class defines a numerical constraints on a robot configuration of the form:     
>
> $$\begin{align*}f_1 (\mathbf{q}) & = \text{or} \leq & f_1^0 \\ & \vdots\\ f_m (\mathbf{q}) & = \text{or} \leq & f_m^0\end{align*}$$
>
>  Functions $f_i$ are differentiable functions. Vectors $f_i^0$ are called right hand side.
>
> The constraints are solved numerically by a Newton Raphson like method.
>
> Numerical constraints can be added using method ConfigProjector::add. Default parameter of this method define equality constraints, but inequality constraints can also be defined by passing an object of type ComparisonType to method.

| Method | Description |
|:---|:---|
| `add` | **numericalConstraint** — The numerical constraint. <br> **priority** — priority of the function. The last level might be optional. |
| `errorThreshold` | Set error threshold. |
| `errorThreshold` | Get error threshold in config projector. |
| `lastIsOptional` | Get whether the last priority level is treated as optional. |
| `lastIsOptional` | Set whether the last priority level is treated as optional. |
| `maxIterations` | Get maximal number of iterations in config projector. |
| `maxIterations` | Set maximal number of iterations. |
| `numericalConstraints` | Return the list of numerical constraints held by this projector. |
| `setRightHandSideFromConfig` | Set right-hand side of all constraints from a configuration. |
| `setRightHandSideOfConstraint` | Set right-hand side of a specific constraint from a configuration. |
| `lineSearchType` *(property)* | Get/set the line search type. |

---

## `ConfigValidation`

*Not instantiable from Python.*

> Abstraction of configuration validation
>
> Instances of this class validate configurations with respect to some criteria

| Method | Description |
|:---|:---|
| `validate` | **config** — the config to check for validity, <br> **validationReport** — report on validation. If non valid, a validation report will be allocated and returned via this shared pointer. |
| `validate` | Validate configuration; returns (valid, report). |

---

## `ConfigValidations`

*Inherits: `ConfigValidation`*  *Not instantiable from Python.*

> Validate a configuration with respect to collision

| Method | Description |
|:---|:---|
| `add` | Add a configuration validation object. |
| `clear` | Remove all config validations. |
| `numberConfigValidations` | Return the number of config validations. |

---

## `ConfigurationShooter`

*Not instantiable from Python.*

> Abstraction of configuration shooter
>
> Configuration shooters are used by random sampling algorithms to generate new configurations

| Method | Description |
|:---|:---|
| `shoot` | Shoot a random configuration. |

---

## `ConnectedComponent`

*Not instantiable from Python.*

> Connected component
>
> Set of nodes reachable from one another.

| Method | Description |
|:---|:---|
| `__eq__` | Return true if both objects refer to the same connected component. |
| `nodes` | Access to the nodes. |

---

## `Constraint`

*Not instantiable from Python.*

> Constraint applicable to a robot configuration
>
> Constraint::apply takes as input a configuration and changes it into a configuration satisfying the constraint.
>
> User should define impl_compute in derived classes.

| Method | Description |
|:---|:---|
| `apply` | Apply constraint to q in-place. Returns true on success. |
| `copy` | Return a copy of this constraint. |
| `isSatisfied` | Return true if configuration q satisfies the constraint. |
| `isSatisfied` | Check if q satisfies the constraint; writes error into error. Returns bool. |
| `name` | Get name of constraint. |

---

## `ConstraintSet`

*Inherits: `Constraint`*

> Set of constraints applicable to a robot configuration
>
> If the set is to contain a ConfigProjector and several LockedJoint instances, the configProjector should be inserted first since following numerical projections might affect locked degrees of freedom.

| Method | Description |
|:---|:---|
| `addConstraint` | Add a constraint to the set. |
| `configProjector` | Return pointer to config projector if any. |

---

## `CppCoreProblem`

*Not instantiable from Python.*

---

## `Dichotomy`

*Inherits: `PathValidation`*

> Abstraction of path validation
>
> Instances of this class compute the latest valid configuration along a path.
>
> Method validate(ConfigurationIn_tq)
>
> is provided to validate single configurations. It is particularly useful to test the initial and goal configurations of a path planning problem using this path validation.

---

## `DichotomyProjector`

*Inherits: `PathProjector`*

> This class projects a path using constraints.

---

## `Discretized`

*Inherits: `PathValidation`*

> Abstraction of path validation
>
> Instances of this class compute the latest valid configuration along a path.
>
> Method validate(ConfigurationIn_tq)
>
> is provided to validate single configurations. It is particularly useful to test the initial and goal configurations of a path planning problem using this path validation.

---

## `Distance`

*Not instantiable from Python.*

> Abstract class for distance between configurations.

---

## `GlobalProjector`

*Inherits: `PathProjector`*

> This class projects a path using constraints.

---

## `JointBoundValidationReport`

*Inherits: `ValidationReport`*  *Not instantiable from Python.*

> report returned when a configuration is not within the bounds

---

## `Node`

> Node of a roadmap
>
> Stores a configuration.

| Method | Description |
|:---|:---|
| `connectedComponent` | Return the connected component the node belongs to. |
| `connectedComponent` | Store the connected component the node belongs to. |
| `inEdges` | Access to inEdges. |
| `outEdges` | Access to outEdges. |

---

## `Parameter`

| Method | Description |
|:---|:---|
| `boolValue` | Return the boolean value of this parameter. |
| `create_bool` | Create a Parameter holding a boolean value. |
| `floatValue` | Return the floating-point value of this parameter. |
| `intValue` | Return the integer value of this parameter. |
| `matrixValue` | Return the matrix value of this parameter. |
| `stringValue` | Return the string value of this parameter. |
| `value` | Return the parameter value as a Python object (bool, int, float, str, numpy array). |
| `vectorValue` | Return the vector value of this parameter. |

---

## `Path`

*Not instantiable from Python.*

> Abstraction of paths: mapping from time to configuration space
>
> A path $ p $ is defined by:    
>
> $$\begin{align*}p : [t_0, t_1] &\to & \mathcal{C} \\ t &\mapsto & constraints.apply( q(t) )\end{align*}$$
>
>  where
>
> $ [t_0, t_1] $ is given by timeRange
>
> $ q(t) $ is the child class implementation of impl_compute
>
> constraints.apply corresponds to calling Constraint::apply to constraints
>
> Optionally, it is possible to time-parameterize the path with a function $ s $. By default, $ s $ is the identity. The model becomes:    
>
> $$\begin{align*}p : [t_0, t_1] &\to & \mathcal{C} \\ t &\mapsto & constraints.apply( q(s(t)) )\end{align*}$$
>
>  where $ s $ is the timeParameterization, from timeRange to paramRange.

| Method | Description |
|:---|:---|
| `__call__` | Evaluate path at parameter t. Returns (configuration, success). |
| `__call__` | Evaluate path at parameter t into q. Returns success flag. |
| `constraints` | Return the constraint set attached to the path, or None. |
| `copy` | Return a shared pointer to a copy of this. |
| `derivative` | Compute derivative of given order at parameter t. Returns a numpy vector. |
| `end` | Get the final configuration. |
| `eval` | Evaluate path at parameter t. Returns (configuration, success). |
| `eval` | Evaluate path at parameter t into q. Returns success flag. |
| `extract` | **subInterval** — interval of definition of the extract path If upper bound of subInterval is smaller than lower bound, result is reversed. <br> :param :is thrown when an end configuration of the returned path could not be computed due to projection failure. |
| `initial` | Get the initial configuration. |
| `length` | Get length of definition interval. |
| `outputDerivativeSize` | Get size of velocity. |
| `outputSize` | Get size of configuration space. |
| `timeRange` | Get interval of definition. |

---

## `PathOptimizer`

*Not instantiable from Python.*

> Abstraction of path optimizer

| Method | Description |
|:---|:---|
| `interrupt` | Interrupt path optimization. |
| `maxIterations` | Set maximal number of iterations. |
| `optimize` | Optimize path. |
| `problem` | Get problem. |
| `timeOut` | set time out (in seconds) |

---

## `PathPlanner`

*Not instantiable from Python.*

> Path planner
>
> Algorithm that computes a path between an initial configuration and a set of goal configurations.

| Method | Description |
|:---|:---|
| `computePath` | Find a path in the roadmap and transform it in trajectory. |
| `finishSolve` | Post processing of the resulting path. |
| `interrupt` | Interrupt path planning. |
| `maxIterations` | Get maximal number of iterations. |
| `maxIterations` | Set maximal number of iterations. |
| `oneStep` | User implementation of one step of resolution. |
| `problem` | Get problem. |
| `roadmap` | Get roadmap. |
| `timeOut` | Get time out. |
| `timeOut` | Set time out (in seconds). |
| `tryConnectInitAndGoals` | Try to connect initial and goal configurations to existing roadmap. |

---

## `PathProjector`

*Not instantiable from Python.*

> This class projects a path using constraints.

| Method | Description |
|:---|:---|
| `apply` | **the** — input path, <br> **the** — output path. |
| `apply` | Apply projection to path; returns (success, projectedPath). |

---

## `PathValidation`

*Not instantiable from Python.*

> Abstraction of path validation
>
> Instances of this class compute the latest valid configuration along a path.
>
> Method validate(ConfigurationIn_tq)
>
> is provided to validate single configurations. It is particularly useful to test the initial and goal configurations of a path planning problem using this path validation.

| Method | Description |
|:---|:---|
| `validate` | :param :the path to check for validity, <br> **reverse** — if true check from the end, <br> **the** — extracted valid part of the path, pointer to path if path is valid. <br> **report** — information about the validation process. A report is allocated if the path is not valid. |
| `validate` | Validate path; returns (valid, validPart, report). |
| `validateConfiguration` | Validate a configuration; returns (valid, report). |

---

## `PathValidationReport`

*Inherits: `ValidationReport`*  *Not instantiable from Python.*

> hpp::core::PathValidationReport

---

## `Problem`

> Defines a path planning problem for one robot. A path planning problem is defined by
>
> a robot: instance of class hpp::pinocchio::Device,
>
> a set of obstacles: a list of hpp::pinocchio::CollisionObject,
>
> initial and goal configurations,
>
> a SteeringMethod to handle the robot dynamics, Additional objects are stored in this object:
>
> a method to validate paths,
>
> a set of methods to validate configurations. Default methods are collision checking and joint bound checking.

| Method | Description |
|:---|:---|
| `addConfigValidation` | Add a config validation method. |
| `addNumericalConstraintsToConfigProjector` | Add constraints with priorities to the config projector, creating it if needed. |
| `addNumericalConstraintsToConfigProjector` | Add constraints at priority 0 to the config projector, creating it if needed. |
| `addPartialCom` | Create a named partial COM computation from a list of joint names. |
| `applyConstraints` | Project config onto active constraints. Returns (success, projected_config, residual_error). |
| `configValidation` | Get the config validations object. |
| `configValidation` | Set the config validations object. |
| `configurationShooter` | Get the configuration shooter. |
| `configurationShooter` | Set the configuration shooter. |
| `createComBetweenFeet` | Create an implicit constraint: COM lies between two contact points. |
| `createRelativeComConstraint` | Create an implicit constraint: relative COM equals a reference point expressed in a joint frame. |
| `createTransformationConstraint` | Create a relative or absolute transformation constraint between two frames, with a 6-bool mask. |
| `createTransformationConstraint` | Create a relative or absolute transformation constraint between two frames, with a 6-bool mask. |
| `directPath` | Compute a direct path using the steering method. Returns (valid, path, report). |
| `distance` | Get the distance function. |
| `distance` | Set the distance function. |
| `getConstraints` | Return the active constraint set. |
| `getParameter` | **name** — of the parameter. |
| `getPartialCom` | Compute and return the position of the named partial center of mass. |
| `initConfig` | Get shared pointer to initial configuration. |
| `isConfigValid` | Validate config against all config validations. Returns (valid, report). |
| `pathProjector` | Get the path projector. |
| `pathProjector` | Set the path projector. |
| `pathValidation` | Get the path validation object. |
| `pathValidation` | Set the path validation object. |
| `robot` | return shared pointer to robot. |
| `setConstantRightHandSide` | If constant=True, set comparison type to EqualToZero; otherwise to Equality. |
| `setConstraints` | Set the active constraint set used by applyConstraints. |
| `setParameter` | **name** — of the parameter. <br> **value** — value of the parameter <br> **std** — :invalid_argument:if a parameter exists but has a different type. |
| `setRightHandSideFromConfig` | Update right-hand side of the config projector from a configuration. |
| `steeringMethod` | Get the steering method. |
| `steeringMethod` | Set the steering method. |
| `target` | Get the problem target. |
| `target` | Set the problem target. |
| `errorThreshold` *(property)* | Error threshold used when creating a new ConfigProjector. |
| `maxIterProjection` *(property)* | Maximum iterations for projection used when creating a new ConfigProjector. |

---

## `ProblemTarget`

*Not instantiable from Python.*

> Problem target
>
> This abstract class defines the goal to be reached by a planning algorithm.

---

## `Progressive`

*Inherits: `PathValidation`*

> Abstraction of path validation
>
> Instances of this class compute the latest valid configuration along a path.
>
> Method validate(ConfigurationIn_tq)
>
> is provided to validate single configurations. It is particularly useful to test the initial and goal configurations of a path planning problem using this path validation.

---

## `ProgressiveProjector`

*Inherits: `PathProjector`*

> This class projects a path using constraints.

---

## `RecursiveHermiteProjector`

*Inherits: `PathProjector`*

> This class projects a path using constraints.

---

## `Roadmap`

> Roadmap built by random path planning methods Nodes are configurations, paths are collision-free paths.

| Method | Description |
|:---|:---|
| `addEdge` | Add nodes at from and to, then add a directed edge between them. |
| `addEdge` | Add nodes at from and to; if bothEdges is true also adds the reverse edge. |
| `addEdges` | **from** — first node <br> **to** — second node <br> :param :path going from |
| `addGoalNode` | **config** — configuration If configuration is already in the roadmap, tag corresponding node as goal node. Otherwise create a new node. |
| `addNode` | Add a node with the given configuration to the roadmap. |
| `addNodeAndEdge` | Add node at 'to' and a single directed edge from the node nearest to 'from'. |
| `addNodeAndEdges` | Add node at 'to' and edges from the node nearest to 'from'. |
| `clear` | Clear the roadmap by deleting nodes and edges. |
| `connectedComponentOfNode` | Return the connected component of the node nearest to the given configuration. |
| `connectedComponents` | Return list of all connected components. |
| `getConnectedComponent` | Return connected component by index. |
| `initNode` | Set the initial node to the given configuration. |
| `initNode` | Return the current initial node object. |
| `insertPathVector` | **backAndForth** — whether to insert the reverse path as well. |
| `merge` | Add the nodes and edges of a roadmap into this one. |
| `nearestNode` | **1.** Find nearest node to configuration (optionally searching in reverse direction). Returns (configuration, minDistance). <br> **2.** Find nearest node within a connected component. Returns (configuration, minDistance). |
| `nearestNodes` | Find the k nearest nodes to configuration. Returns a list of nodes. |
| `nearestNodes` | Find the k nearest nodes within a connected component. |
| `nodes` | Return list of all node configurations in the roadmap. |
| `nodesConnectedComponent` | Return list of configurations in the connected component identified by connectedComponentId. |
| `numberConnectedComponents` | Return the number of connected components. |
| `pathExists` | Check that a path exists between the initial node and one goal node. |

---

## `SimpleTimeParameterization`

*Inherits: `PathOptimizer`*

| Method | Description |
|:---|:---|
| `maxAcceleration` *(property)* | The maximum acceleration for each degree of freedom. Not considered if negative. |
| `order` *(property)* | The desired continuity order (0, 1, or 2). |
| `safety` *(property)* | A scaling factor for the velocity bounds. |

---

## `SplineGradientBased_bezier1`

*Inherits: `PathOptimizer`*

| Method | Description |
|:---|:---|
| `QPAccuracy` *(property)* | Accuracy of the QP solver (only used by proxqp). |
| `alphaInit` *(property)* | In [0,1]. Initial value when interpolating between non-colliding current solution and the optimal colliding trajectory. |
| `alwaysStopAtFirst` *(property)* | If true, consider only one (not all) collision constraint per iteration. |
| `checkJointBound` *(property)* | If true, joint bounds are enforced. |
| `costOrder` *(property)* | Order of the derivative used for the optimized cost function (most likely 1, 2, or 3). |
| `costThreshold` *(property)* | Stop optimizing if the cost improves less than this threshold between two iterations. |
| `guessThreshold` *(property)* | Threshold to detect rows of zeros in the Jacobian (passive DoF). Negative disables the check. |
| `linearizeAtEachStep` *(property)* | If true, collision constraint will be re-linearized at each iteration. |
| `reorderIntervals` *(property)* | If true, intervals in collision are checked first at the next iteration. |
| `returnOptimum` *(property)* | If true, returns the optimum regardless of collision (for debugging). |
| `usePathLengthAsWeights` *(property)* | If true, the initial path length is used to weight the splines. |

---

## `SplineGradientBased_bezier3`

*Inherits: `PathOptimizer`*

| Method | Description |
|:---|:---|
| `QPAccuracy` *(property)* | Accuracy of the QP solver (only used by proxqp). |
| `alphaInit` *(property)* | In [0,1]. Initial value when interpolating between non-colliding current solution and the optimal colliding trajectory. |
| `alwaysStopAtFirst` *(property)* | If true, consider only one (not all) collision constraint per iteration. |
| `checkJointBound` *(property)* | If true, joint bounds are enforced. |
| `costOrder` *(property)* | Order of the derivative used for the optimized cost function (most likely 1, 2, or 3). |
| `costThreshold` *(property)* | Stop optimizing if the cost improves less than this threshold between two iterations. |
| `guessThreshold` *(property)* | Threshold to detect rows of zeros in the Jacobian (passive DoF). Negative disables the check. |
| `linearizeAtEachStep` *(property)* | If true, collision constraint will be re-linearized at each iteration. |
| `reorderIntervals` *(property)* | If true, intervals in collision are checked first at the next iteration. |
| `returnOptimum` *(property)* | If true, returns the optimum regardless of collision (for debugging). |
| `usePathLengthAsWeights` *(property)* | If true, the initial path length is used to weight the splines. |

---

## `SplineGradientBased_bezier5`

*Inherits: `PathOptimizer`*

| Method | Description |
|:---|:---|
| `QPAccuracy` *(property)* | Accuracy of the QP solver (only used by proxqp). |
| `alphaInit` *(property)* | In [0,1]. Initial value when interpolating between non-colliding current solution and the optimal colliding trajectory. |
| `alwaysStopAtFirst` *(property)* | If true, consider only one (not all) collision constraint per iteration. |
| `checkJointBound` *(property)* | If true, joint bounds are enforced. |
| `costOrder` *(property)* | Order of the derivative used for the optimized cost function (most likely 1, 2, or 3). |
| `costThreshold` *(property)* | Stop optimizing if the cost improves less than this threshold between two iterations. |
| `guessThreshold` *(property)* | Threshold to detect rows of zeros in the Jacobian (passive DoF). Negative disables the check. |
| `linearizeAtEachStep` *(property)* | If true, collision constraint will be re-linearized at each iteration. |
| `reorderIntervals` *(property)* | If true, intervals in collision are checked first at the next iteration. |
| `returnOptimum` *(property)* | If true, returns the optimum regardless of collision (for debugging). |
| `usePathLengthAsWeights` *(property)* | If true, the initial path length is used to weight the splines. |

---

## `SteeringMethod`

*Not instantiable from Python.*

> Steering method
>
> A steering method creates paths between pairs of configurations for a robot. They are usually used to take into account nonholonomic constraints of some robots

| Method | Description |
|:---|:---|
| `__call__` | Compute a path between two configurations using the steering method. |
| `constraints` | Set constraint set. |
| `constraints` | Get constraint set. |

---

## `TrapezoidalTimeParameterization`

*Inherits: `PathOptimizer`*

| Method | Description |
|:---|:---|
| `maxAcceleration` *(property)* | Maximum acceleration for each output degree of freedom. |
| `maxVelocity` *(property)* | Maximum velocity for each output degree of freedom. |
| `minimumDuration` *(property)* | Minimum duration assigned to each non-empty subpath. |

---

## `ValidationReport`

*Not instantiable from Python.*

> Abstraction of validation report for paths and configurations
>
> This class is aimed at being derived to store information relative to various Validation derived classes
>
> CollisionValidation,
>
> collision related PathValidation classes.

---

## `WeighedDistance`

*Inherits: `Distance`*

> Weighed distance between configurations
>
> Euclidean distance between configurations seen as vectors. Each degree of freedom is weighed by a positive value.

| Method | Description |
|:---|:---|
| `asDistancePtr_t` | Return a clone of this WeighedDistance as a Distance shared pointer. |
| `getWeights` | Return the weight vector used when computing distances. |
| `setWeights` | Set the weight vector used when computing distances. |

---

## Functions

| Function | Description |
|:---|:---|
| `DiscretizedCollision()` | Create a discretized collision-checking path validation. |
| `DiscretizedCollisionAndJointBound()` | Create a discretized path validation checking both collision and joint bounds. |
| `DiscretizedJointBound()` | Create a discretized joint-bound path validation. |
| `NoneProjector()` | Return a null path projector (no projection). |
