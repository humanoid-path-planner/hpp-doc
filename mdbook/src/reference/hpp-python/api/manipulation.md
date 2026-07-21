# `pyhpp.manipulation`

## Functions

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">DichotomyProjector</span>(distance: <a href="core.md#distance">pyhpp.core.bindings.Distance</a>, steeringMethod: <a href="core.md#steeringmethod">pyhpp.core.bindings.SteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <a href="core.md#dichotomyprojector">pyhpp.core.bindings.DichotomyProjector</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">DichotomyProjector</span>(distance: <a href="core.md#distance">pyhpp.core.bindings.Distance</a>, steeringMethod: <a href="#graphsteeringmethod">GraphSteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <a href="core.md#dichotomyprojector">pyhpp.core.bindings.DichotomyProjector</a></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">GlobalProjector</span>(distance: <a href="core.md#distance">pyhpp.core.bindings.Distance</a>, steeringMethod: <a href="core.md#steeringmethod">pyhpp.core.bindings.SteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <a href="core.md#globalprojector">pyhpp.core.bindings.GlobalProjector</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">GlobalProjector</span>(distance: <a href="core.md#distance">pyhpp.core.bindings.Distance</a>, steeringMethod: <a href="#graphsteeringmethod">GraphSteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <a href="core.md#globalprojector">pyhpp.core.bindings.GlobalProjector</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">GraphPartialShortcut</span>(arg1: <span class="hljs-built_in">object</span>) -&gt; <a href="core.md#pathoptimizer">pyhpp.core.bindings.PathOptimizer</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">GraphRandomShortcut</span>(arg1: <span class="hljs-built_in">object</span>) -&gt; <a href="core.md#pathoptimizer">pyhpp.core.bindings.PathOptimizer</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">NoneProjector</span>() -&gt; <a href="core.md#pathprojector">pyhpp.core.bindings.PathProjector</a></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">ProgressiveProjector</span>(distance: <a href="core.md#distance">pyhpp.core.bindings.Distance</a>, steeringMethod: <a href="core.md#steeringmethod">pyhpp.core.bindings.SteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <a href="core.md#progressiveprojector">pyhpp.core.bindings.ProgressiveProjector</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">ProgressiveProjector</span>(distance: <a href="core.md#distance">pyhpp.core.bindings.Distance</a>, steeringMethod: <a href="#graphsteeringmethod">GraphSteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <a href="core.md#progressiveprojector">pyhpp.core.bindings.ProgressiveProjector</a></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">RecursiveHermiteProjector</span>(distance: <a href="core.md#distance">pyhpp.core.bindings.Distance</a>, steeringMethod: <a href="core.md#steeringmethod">pyhpp.core.bindings.SteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <a href="core.md#recursivehermiteprojector">pyhpp.core.bindings.RecursiveHermiteProjector</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">RecursiveHermiteProjector</span>(distance: <a href="core.md#distance">pyhpp.core.bindings.Distance</a>, steeringMethod: <a href="#graphsteeringmethod">GraphSteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <a href="core.md#recursivehermiteprojector">pyhpp.core.bindings.RecursiveHermiteProjector</a></code> |  |

## `Device`

*Inherits: [`pyhpp.pinocchio.bindings.Device`](pinocchio.md#device)*

> Device with handles.
>
> As a deriving class of hpp::pinocchio::HumanoidRobot, it is compatible with hpp::pinocchio::urdf::loadHumanoidRobot
>
> This class also contains pinocchio::Gripper, Handle and JointAndShapes_t

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addGripper</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">str</span>, arg4: pinocchio.pinocchio_pywrap_default.SE3, arg5: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> | Add a gripper to the kinematic chain |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addHandle</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">str</span>, arg4: pinocchio.pinocchio_pywrap_default.SE3, arg5: <span class="hljs-built_in">float</span>, arg6: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <span class="hljs-literal">None</span></code> | Add a handle to the kinematic chain |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">asPinDevice</span>(arg1: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">contactSurfaceNames</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return list of contact surface names registered on device |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">contactSurfaces</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">dict</span></code> | Return dict mapping surface names to list of {joint, points} |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getJointConfig</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return current configuration values of the named joint. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getJointNames</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return list of all joint names in the Pinocchio model. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">grippers</span>(<span class="hljs-params">self</span>) -&gt; <a href="pinocchio.md#grippermap">pyhpp.pinocchio.bindings.GripperMap</a></code> | Return a map from gripper name to Gripper object. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">handles</span>(<span class="hljs-params">self</span>) -&gt; <a href="#handlemap">HandleMap</a></code> | Return a map from handle name to Handle object. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">modelsInfo</span>(<span class="hljs-params">self</span>) -&gt; <a href="#modelsinfovec">modelsInfoVec</a></code> | Return list of modelsInfo stored in the device, each element contains the urdf path, srdf path, prefix and initial pose of a model loaded in the device |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setJointBounds</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> | Set joint bounds from a flat list [min0, max0, min1, max1, ...]. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setRobotRootPosition</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: pinocchio.pinocchio_pywrap_default.SE3) -&gt; <span class="hljs-literal">None</span></code> | Set the root position of a sub-robot (identified by name) relative to its parent joint. |

---

## `EndEffectorTrajectory`

*Inherits: [`pyhpp.core.bindings.PathPlanner`](core.md#pathplanner)*

> Plan a path for a robot with constrained trajectory of an end effector
>
> This path planner only works with a steering method of type steeringMethod::EndEffectorTrajectory. The steering method defines the desired end-effector trajectory using a time-varying constraint.
>
> To plan a path between two configurations q_init and q_goal, the configurations must satisfy the constraint at the beginning and at the end of the definition interval respectively.
>
> The interval of definition $[0,T]$ of the output path is defined by the time-varying constraint of the steering method. This interval is uniformly discretized in a number of samples that can be accessed using method nDiscreteSteps .
>
> The path is planned by successively calling method oneStep  that performs the following actions.
>
> A vector of configurations is produced by appending random configurations to q_init. The number of random configurations can be accessed by methods nRandomConfig .
>
> for each configuration in the vector,
>
> the initial configuration of the path is computed by projecting the configuration on the constraint,
>
> the configuration at following samples is computed by projecting the configuration at the previous sample using the time-varying constraint.
>
> In case of failure
>
> in projecting a configuration or
>
> in validating the path for collision, the loop restart with the next random configuration.
>
> Note that continuity is not tested but enforced by projecting the configuration of the previous sample to compute the configuration at a given sample. DeprecatedThis class has been reimplemented and simplified as steeringMethod::Cartesian.

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#problem">pyhpp.core.bindings.Problem</a>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#problem">pyhpp.core.bindings.Problem</a>, arg3: <a href="core.md#roadmap">pyhpp.core.bindings.Roadmap</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkFeasibilityOnly</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkFeasibilityOnly</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> | If enabled, only add one solution to the roadmap. Otherwise add all solutions. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nDiscreteSteps</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nDiscreteSteps</span>(<span class="hljs-params">self</span>, arg2: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <span class="hljs-literal">None</span></code> | Number of steps to generate goal config (successive projections). |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nRandomConfig</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nRandomConfig</span>(<span class="hljs-params">self</span>, arg2: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the number of random configurations used to generate the initial config of the final path. |

---

## `EndEffectorTrajectorySteeringMethod`

*Inherits: [`pyhpp.core.bindings.SteeringMethod`](core.md#steeringmethod)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setTrajectory</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#path">pyhpp.core.bindings.Path</a>, arg3: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> | Set the right hand side of the trajectory constraint from a path. param se3Output: set to True if the output of path must be understood as SE3. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setTrajectoryConstraint</span>(<span class="hljs-params">self</span>, arg2: <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a>) -&gt; <span class="hljs-literal">None</span></code> | Set the constraint whose right hand side will vary along the trajectory. |

---

## `EnforceTransitionSemantic`

*Inherits: [`pyhpp.core.bindings.PathOptimizer`](core.md#pathoptimizer)*

> Recompute the transition relative to each element of the path vector
>
> When executing a sequence of direct paths on a real robot, it is useful to know which
>
> transition of the graph each direct path corresponds to. For example, in a manipulation
>
> motion, before grasping an object, the robot needs to open the gripper. This information
>
> is contained in the transition that leads to a pregrasp waypoint state. The direct path
>
> should therefore have access to the transition.
>
> The information is stored in the hpp::manipulation::ConstraintSet.
>
> of the path and is accessible via method hpp::manipulation::ConstraintSet::edge
>
> If the path vector is produced by a manipulation planner, each direct path has been created
>
> by a transition. However, the path may later be cut by random shortcut or due to collision and
>
> the associated transition become irrelevant. For example if a path is created by a transition
>
> that leads to a pre-grasp, and cut due to a collision, the path does not reach the target
>
> state and the relevant transition is not the one that built the path.
>
> This class takes a hpp::core::PathVector as input an relabel
>
> each direct path with the correct transition.
>
> **Precondition** — The path should have been created by a manipulation planning algorithm: in other
>
> words, the constraint set of each direct path should be of type
>
> hpp::manipulation::ConstraintSet.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |

---

## `Graph`

> Description of the constraint graph.
>
> This class contains a graph representing a a manipulation problem
>
> One must make sure not to create loop with shared pointers. To ensure that, the classes are defined as follow:
>
> A Graph owns (i.e. has a shared pointer to) the StateSelector s
>
> A StateSelector owns the Node s related to one gripper.
>
> A State owns its outgoing Edge s.
>
> An Edge does not own anything.
>
> The graph and all its components have a unique index starting at 0 for the graph itself. The index of a component can be retrieved using method GraphComponent::id.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <a href="pinocchio.md#device">Device</a>, arg4: <a href="#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">_get_native_graph</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> | Return a capsule wrapping the native C++ Graph object (for external interop). |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addLevelSetFoliation</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: <span class="hljs-built_in">list</span>, arg4: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> | Add the numerical constraints to a LevelSetTransition that create the foliation. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNumericalConstraint</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>, arg3: <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a>) -&gt; <span class="hljs-literal">None</span></code> | Add a numerical constraint to a state. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNumericalConstraintsForPath</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>, arg3: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> | Add numerical constraints for path to a state. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNumericalConstraintsToGraph</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> | Add a list of numerical constraints to all transitions in the graph. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNumericalConstraintsToState</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>, arg3: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> | Add numerical constraints to a state. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNumericalConstraintsToTransition</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> | Add numerical constraints to a TRANSITION. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">applyLeafConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: numpy.ndarray, arg4: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Apply transition constraints to a configuration. Returns tuple with success flag, output configuration, and error norm. If success, the output configuration is reachable from q_rhs along the transition. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">applyStateConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Apply constraints to a configuration. Returns tuple with success flag, output configuration, and error norm. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createGraspConstraint</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">str</span>, arg4: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-built_in">list</span></code> | Create grasp, complement and hold constraints for a gripper-handle pair. Returns a list [grasp, complement, hold]. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createLevelSetTransition</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>, arg3: <a href="#state">State</a>, arg4: <span class="hljs-built_in">str</span>, arg5: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>, arg6: <a href="#state">State</a>) -&gt; <a href="#transition">Transition</a></code> | Create a LevelSetTransition. See documentation of class hpp::manipulation::graph::LevelSetEdge for more information. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">createPlacementConstraint</span>(*args, **kwargs)</code> | Create placement constraint between object surfaces and environment surfaces. Creates constraints that ensure proper contact between object and environment. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createPreGraspConstraint</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">str</span>, arg4: <span class="hljs-built_in">str</span>) -&gt; <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a></code> | Create a pre-grasp constraint for a gripper-handle pair. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">createPrePlacementConstraint</span>(*args, **kwargs)</code> | Create pre-placement constraint with specified width margin. Used for approaching placement configurations before final placement. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createState</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">bool</span>, arg4: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <a href="#state">State</a></code> | Create one or several states. The order is important - the first should be the most restrictive one as a configuration will be in the first state for which the constraints are satisfied. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createSubGraph</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <a href="core.md#roadmap">pyhpp.core.bindings.Roadmap</a>) -&gt; <span class="hljs-literal">None</span></code> | Create a subgraph with guided state selection. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createTransition</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>, arg3: <a href="#state">State</a>, arg4: <span class="hljs-built_in">str</span>, arg5: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>, arg6: <a href="#state">State</a>) -&gt; <a href="#transition">Transition</a></code> | Create a transition. The weights define the probability of selecting a transition among all the outgoing transitions of a state. The probability of a transition is w_i / sum(w_j), where each w_j corresponds to an outgoing transition from a given state. To have a transition that cannot be selected by the M-RRT algorithm but is still acceptable, set its weight to zero. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createWaypointTransition</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>, arg3: <a href="#state">State</a>, arg4: <span class="hljs-built_in">str</span>, arg5: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>, arg6: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>, arg7: <a href="#state">State</a>, arg8: <span class="hljs-built_in">bool</span>) -&gt; <a href="#transition">Transition</a></code> | Create a WaypointTransition. See documentation of class hpp::manipulation::graph::WaypointEdge for more information. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">display</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> | Display the current graph. The graph is printed in DOT format. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">displayStateConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>) -&gt; <span class="hljs-built_in">str</span></code> | Print set of constraints relative to a state in a string. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">displayTransitionConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>) -&gt; <span class="hljs-built_in">str</span></code> | Print set of constraints relative to a transition in a string. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">displayTransitionTargetConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>) -&gt; <span class="hljs-built_in">str</span></code> | Print set of constraints relative to a transition in a string. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> | Get error threshold in config projector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">generateTargetConfig</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: numpy.ndarray, arg4: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Generate configuration in destination state on a given leaf. Returns tuple with success flag, output configuration, and error norm. Computes a configuration in the destination state of the transition, reachable from q_rhs. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getConfigErrorForState</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Get error of a config with respect to a state constraint. Returns whether the configuration belongs to the state. Calls core::ConstraintSet::isSatisfied for the state constraints. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getConfigErrorForTransition</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Get error of a config with respect to a transition constraint. Returns whether the configuration belongs to the transition. Calls core::ConfigProjector::rightHandSideFromConfig with the input configuration and then core::ConstraintSet::isSatisfied on the transition constraints. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getConfigErrorForTransitionLeaf</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: numpy.ndarray, arg4: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Get error of a config with respect to a transition foliation leaf. Returns whether config can be the end point of a path of the transition starting at leafConfig. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getConfigErrorForTransitionTarget</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: numpy.ndarray, arg4: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Get error of a config with respect to the target of a transition foliation leaf. Returns whether config can be the end point of a path of the transition starting at leafConfig. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getContainingNode</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>) -&gt; <span class="hljs-built_in">str</span></code> | Get the name of the state in which a transition is. Paths satisfying the transition constraints satisfy the state constraints. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getNodesConnectedByTransition</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>) -&gt; <span class="hljs-built_in">tuple</span></code> | Get the names of the states connected by a transition. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getNumericalConstraintsForEdge</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>) -&gt; <span class="hljs-built_in">list</span></code> | Get numerical constraints of an edge. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getNumericalConstraintsForGraph</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Get numerical constraints of the graph. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getNumericalConstraintsForState</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>) -&gt; <span class="hljs-built_in">list</span></code> | Get numerical constraints of a state. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getRelativeMotionMatrix</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>) -&gt; <span class="hljs-built_in">list</span></code> | Get relative motion matrix for a transition as list of lists. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getSecurityMarginMatrixForTransition</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>) -&gt; <span class="hljs-built_in">list</span></code> | Get security margin matrix for a transition as list of lists. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getState</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <a href="#state">State</a></code> | Return the state with the given name. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getStateFromConfiguration</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">str</span></code> | Get the name of the state corresponding to the configuration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getStateNames</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return a list of state names. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getStates</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return a list of all states in the constraint graph. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getTransition</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <a href="#transition">Transition</a></code> | Return the transition with the given name. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getTransitionNames</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return a list of transition names. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getTransitions</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return a list of all transitions in the constraint graph. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getWeight</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>) -&gt; <span class="hljs-built_in">int</span></code> | Get weight of a transition. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">initialize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Initialize the graph. Performs final initialization of the constraint graph. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">isShort</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>) -&gt; <span class="hljs-built_in">bool</span></code> | Check if a transition is short. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> | Get maximal number of iterations in config projector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">registerConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a>, arg3: <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a>, arg4: <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a>) -&gt; <span class="hljs-literal">None</span></code> | Register constraints in the graph. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">removeCollisionPairFromTransition</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: <span class="hljs-built_in">str</span>, arg4: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> | Remove collision pairs from a transition. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">resetConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="#state">State</a>) -&gt; <span class="hljs-literal">None</span></code> | Reset constraints of a state. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setContainingNode</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: <a href="#state">State</a>) -&gt; <span class="hljs-literal">None</span></code> | Set in which state a transition is. Paths satisfying the transition constraints satisfy the state constraints. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setSecurityMarginForTransition</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: <span class="hljs-built_in">str</span>, arg4: <span class="hljs-built_in">str</span>, arg5: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> | Set collision security margin for a pair of joints along a transition. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setShort</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> | Set that a transition is short. When a transition is tagged as short, extension along this transition is done differently in RRT-like algorithms. Instead of projecting a random configuration in the destination state, the configuration to extend itself is projected in the destination state. This makes the rate of success higher. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setTargetNodeList</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> | Set the target state list for guided state selection. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setWaypoint</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>, arg4: <a href="#transition">Transition</a>, arg5: <a href="#state">State</a>) -&gt; <span class="hljs-literal">None</span></code> | Set waypoint configuration for a waypoint transition. Configures which edge and state to use at the specified waypoint index. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setWeight</span>(<span class="hljs-params">self</span>, arg2: <a href="#transition">Transition</a>, arg3: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <span class="hljs-literal">None</span></code> | Set weight of a transition. You cannot set weight for waypoint transitions. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">transitionAtParam</span>(arg1: <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a>, arg2: <span class="hljs-built_in">float</span>) -&gt; <a href="#transition">Transition</a></code> | Return the transition used at a given parameter on a path (static method). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">robot</span>(*args, **kwargs)<br><br><span class="hljs-meta">@robot.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">robot</span>(*args, **kwargs)</code> | The robot device of the constraint graph. |

---

## `GraphSteeringMethod`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#steeringmethod">pyhpp.core.bindings.SteeringMethod</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `Handle`

> Frame attached to an object that is aimed at being grasped
>
> Together with a hpp::pinocchio::Gripper, a handle defines a grasp. A vector of 6 Boolean values called a mask can be passed to the constructor to define the symmetries of the handle. For example, {True,True,True,False,True,True} means that the handle can be grasped with free orientation around x-axis. See https://hal.laas.fr/hal-02995125v2 for details. The setter method mask allows users to define the mask.
>
> Along motions where the handle is grasped by a gripper, an additional constraint is enforced, called the complement constraint. This latter constraint ensures that the object is rigidly fixed to the gripper.
>
> However, for some applications, the complement constraint can be customized using setter maskComp. Note that calling setter method mask reinitializes the mask complement.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createGrasp</span>(<span class="hljs-params">self</span>, gripper: <a href="pinocchio.md#gripper">pyhpp.pinocchio.bindings.Gripper</a>, name: <span class="hljs-built_in">str</span>) -&gt; <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a></code> | **gripper** — object containing the gripper information |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createGraspAndComplement</span>(<span class="hljs-params">self</span>, gripper: <a href="pinocchio.md#gripper">pyhpp.pinocchio.bindings.Gripper</a>, name: <span class="hljs-built_in">str</span>) -&gt; <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a></code> | **gripper** — object containing the gripper information |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createGraspComplement</span>(<span class="hljs-params">self</span>, gripper: <a href="pinocchio.md#gripper">pyhpp.pinocchio.bindings.Gripper</a>, name: <span class="hljs-built_in">str</span>) -&gt; <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a></code> | **gripper** — object containing the gripper information |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createPreGrasp</span>(<span class="hljs-params">self</span>, gripper: <a href="pinocchio.md#gripper">pyhpp.pinocchio.bindings.Gripper</a>, shift: <span class="hljs-built_in">float</span>, name: <span class="hljs-built_in">str</span>) -&gt; <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a></code> | **gripper** — object containing the gripper information |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getParentJointId</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Get index of the joint the handle is attached to in pinocchio Model |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">approachingDirection</span>(*args, **kwargs)<br><br><span class="hljs-meta">@approachingDirection.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">approachingDirection</span>(*args, **kwargs)</code> | Approaching direction for pregrasp (unit vector in handle frame, default is x-axis). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">clearance</span>(*args, **kwargs)<br><br><span class="hljs-meta">@clearance.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">clearance</span>(*args, **kwargs)</code> | Distance from the center of the gripper along x-axis that ensures no collision. Also gives an order of magnitude of the gripper size. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">localPosition</span>(*args, **kwargs)<br><br><span class="hljs-meta">@localPosition.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">localPosition</span>(*args, **kwargs)</code> | Local position of the handle in the joint frame. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">mask</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span><br><br><span class="hljs-meta">@mask.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">mask</span>(<span class="hljs-params">self</span>, value: list[bool]) -&gt; <span class="hljs-literal">None</span></code> | Constraint mask: vector&lt;bool&gt; of size 6 defining the symmetries of the handle. See Handle class documentation for details. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maskComp</span>(*args, **kwargs)<br><br><span class="hljs-meta">@maskComp.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maskComp</span>(*args, **kwargs)</code> | Mask of the complement constraint. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(*args, **kwargs)<br><br><span class="hljs-meta">@name.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(*args, **kwargs)</code> | Name of the handle. |

---

## `HandleMap`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__contains__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__delitem__</span>(<span class="hljs-params">self</span>, key: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__getitem__</span>(<span class="hljs-params">self</span>, key: <span class="hljs-built_in">str</span>) -&gt; <a href="#handle">Handle</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__iter__</span>(<span class="hljs-params">self</span>) -&gt; typing.Iterator[str]</code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__len__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__setitem__</span>(<span class="hljs-params">self</span>, key: <span class="hljs-built_in">str</span>, value: <a href="#handle">Handle</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `ManipulationPlanner`

*Inherits: [`pyhpp.core.bindings.PathPlanner`](core.md#pathplanner)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#problem">pyhpp.core.bindings.Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `Problem`

*Inherits: [`pyhpp.core.bindings.Problem`](core.md#problem)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="pinocchio.md#device">Device</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkProblem</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Check whether the problem is well formulated. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">constraintGraph</span>(<span class="hljs-params">self</span>) -&gt; <a href="#graph">Graph</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">constraintGraph</span>(<span class="hljs-params">self</span>, arg2: <a href="#graph">Graph</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the graph of constraints. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">fullSteeringMethod</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#steeringmethod">pyhpp.core.bindings.SteeringMethod</a>) -&gt; <span class="hljs-literal">None</span></code> | Set the problem steering method directly. Unlike steeringMethod, this does not wrap the given steering method in a manipulation graph steering method. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">steeringMethod</span>(<span class="hljs-params">self</span>) -&gt; <a href="core.md#steeringmethod">pyhpp.core.bindings.SteeringMethod</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">steeringMethod</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#steeringmethod">pyhpp.core.bindings.SteeringMethod</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the inner steering method (unwrapped from the graph steering method if applicable). |

---

## `RandomShortcut`

*Inherits: [`pyhpp.core.bindings.PathOptimizer`](core.md#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |

---

## `SplineGradientBased_bezier1`

*Inherits: [`pyhpp.core.bindings.PathOptimizer`](core.md#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#problem">pyhpp.core.bindings.Problem</a>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@QPAccuracy.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@alphaInit.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@alwaysStopAtFirst.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@checkJointBound.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@costOrder.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@costThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@guessThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@linearizeAtEachStep.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@reorderIntervals.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@returnOptimum.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@usePathLengthAsWeights.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `SplineGradientBased_bezier3`

*Inherits: [`pyhpp.core.bindings.PathOptimizer`](core.md#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#problem">pyhpp.core.bindings.Problem</a>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@QPAccuracy.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@alphaInit.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@alwaysStopAtFirst.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@checkJointBound.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@costOrder.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@costThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@guessThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@linearizeAtEachStep.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@reorderIntervals.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@returnOptimum.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@usePathLengthAsWeights.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `State`

> State of an end-effector.
>
> States of the graph of constraints. There is one graph for each end-effector.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">configConstraint</span>(<span class="hljs-params">self</span>) -&gt; <a href="core.md#constraintset">pyhpp.core.bindings.ConstraintSet</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">id</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Return the component id. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> | Get the component name. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">neighborEdges</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Get the list of edges connected to this state. |

---

## `StatesPathFinder`

*Inherits: [`pyhpp.core.bindings.PathPlanner`](core.md#pathplanner)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#problem">pyhpp.core.bindings.Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `Transition`

> Transition between two states of a constraint graph
>
> An edge stores two types of constraints.
>
> Path constraints  should be safisfied by paths belonging to the edge. Along any path, the right hand side of the constraint is constant, but can differ between paths. For instance if an edge represents a transit path of a robot that can grasp an object, the right hand side of the constraint represents the position of the object. Along any transit path, the object does not move, but for different paths the object can be at different positions. method pathConstraint.
>
> Configuration constraints  are constraints that configurations in the destination state should satisfy and the constraints that paths should satisfy. For instance, if the edge links a state where the robot does not hold the object to a state where the robot holds the object, the configuration constraints represent a fixed relative position of the object with respect to the gripper and a stable position of the object. Configuration constraints are necessary to generate a configuration in the destination state of the edge that is reachable from a given configuration in the start state by an admissible path.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">id</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Return the component id. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">isWaypointTransition</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span></code> | **Error** — Could not find member (.*) isWaypointEdge of class hpp::manipulation::graph::Edge |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> | Get the component name. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nbWaypoints</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nbWaypoints</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | **Error** — Could not find member (.*) nbWaypoints of class hpp::manipulation::graph::Edge |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">pathValidation</span>(<span class="hljs-params">self</span>) -&gt; <a href="core.md#pathvalidation">pyhpp.core.bindings.PathValidation</a></code> | Get path validation associated to the edge. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">waypoint</span>(<span class="hljs-params">self</span>, arg2: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <a href="#transition">Transition</a></code> | **Error** — Could not find member (.*) waypoint of class hpp::manipulation::graph::Edge |

---

## `TransitionPlanner`

*Inherits: [`pyhpp.core.bindings.PathPlanner`](core.md#pathplanner)*

> Plan paths in a leaf of a transition
>
> In many manipulation applications, the sequence of actions is knwown in advance or computed by a task planner. There is a need then to connect configurations that lie on the same leaf of a transition. This class performs this computation.
>
> The constraint graph is stored in the Problem instance of the planner. To select the transition, call method setEdge  with the index of the transition.
>
> At construction, a core::Problem instance is created, as well as a core::PathPlanner instance. They are respectively called the inner problem and the inner planner.
>
> In order to take into account security margins, when selecting a transition, the list of configuration validations passed to the inner problem are
>
> the PathValidation instance of the transition, cast into core::ConfigValidation type
>
> a core::JointBoundValidation instance.
>
> The leaf of the transition is defined by the initial configuration passed to method planPath . The right hand side of the inner problem constraints is initialized with this configuration.
>
> The class stores path optimizers that are called when invoking method optimizePath .
>
> Method timeParameterization  computes a time parameterization of a given path.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#problem">pyhpp.core.bindings.Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addPathOptimizer</span>(<span class="hljs-params">self</span>, pathOptimizer: <a href="core.md#pathoptimizer">pyhpp.core.bindings.PathOptimizer</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">clearPathOptimizers</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Clear path optimizers. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">computePath</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray, self_: <span class="hljs-built_in">bool</span>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">directPath</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray, arg4: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-built_in">tuple</span></code> | Compute a direct path on a transition. Returns (success, path, status). |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">innerPlanner</span>(<span class="hljs-params">self</span>) -&gt; <a href="core.md#pathplanner">pyhpp.core.bindings.PathPlanner</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">innerPlanner</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#pathplanner">pyhpp.core.bindings.PathPlanner</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the inner planner. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">innerProblem</span>(<span class="hljs-params">self</span>) -&gt; <a href="core.md#problem">pyhpp.core.bindings.Problem</a></code> | Get the inner problem. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">optimizePath</span>(<span class="hljs-params">self</span>, path: <a href="core.md#path">pyhpp.core.bindings.Path</a>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> | :param :input path |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">pathProjector</span>(<span class="hljs-params">self</span>, pathProjector: <a href="core.md#pathprojector">pyhpp.core.bindings.PathProjector</a>) -&gt; <span class="hljs-literal">None</span></code> | Set the path projector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">planPath</span>(<span class="hljs-params">self</span>, qInit: numpy.ndarray, qGoals: numpy.ndarray, resetRoadmap: <span class="hljs-built_in">bool</span>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> | **qInit** — initial configuration, :param qGoals goal:configurations, **resetRoadmap** — whether to reset the roadmap |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setEdge</span>(<span class="hljs-params">self</span>, id: <a href="#transition">Transition</a>) -&gt; <span class="hljs-literal">None</span></code> | **id** — index of the transition in the constraint graph |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setReedsAndSheppSteeringMethod</span>(<span class="hljs-params">self</span>, turningRadius: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> | Create a Reeds and Shepp steering method and path it to the problem. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setTransition</span>(<span class="hljs-params">self</span>, id: <a href="#transition">Transition</a>) -&gt; <span class="hljs-literal">None</span></code> | **id** — index of the transition in the constraint graph |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">timeParameterization</span>(<span class="hljs-params">self</span>, path: <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> | :param :input path |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">validateConfiguration</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">tuple</span></code> | Validate configuration against the graph state identified by id. Returns (valid, report). |

---

## `map_indexing_suite_HandleMap_entry`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__repr__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">data</span>(<span class="hljs-params">self</span>) -&gt; <a href="#handle">Handle</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">key</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |

---

## `modelsInfo`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">pose</span>(<span class="hljs-params">self</span>) -&gt; pinocchio.pinocchio_pywrap_default.SE3<br><br><span class="hljs-meta">@pose.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">pose</span>(<span class="hljs-params">self</span>, arg2: pinocchio.pinocchio_pywrap_default.SE3) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">prefix</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span><br><br><span class="hljs-meta">@prefix.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">prefix</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">srdfPath</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span><br><br><span class="hljs-meta">@srdfPath.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">srdfPath</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">urdfPath</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span><br><br><span class="hljs-meta">@urdfPath.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">urdfPath</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `modelsInfoVec`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__contains__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__delitem__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__getitem__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__iter__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__len__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__setitem__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">append</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">extend</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |

---
