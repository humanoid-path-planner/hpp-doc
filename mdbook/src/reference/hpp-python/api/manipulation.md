# `pyhpp.manipulation`

## `Device`

*Inherits: [`pyhpp.pinocchio.bindings.Device`](pinocchio.md#device)*

> Device with handles.
>
> As a deriving class of hpp::pinocchio::HumanoidRobot, it is compatible with hpp::pinocchio::urdf::loadHumanoidRobot
>
> This class also contains pinocchio::Gripper, Handle and JointAndShapes_t

| Method | Description |
|:---|:---|
| `addGripper` | Add a gripper to the kinematic chain <br> *Input:* <br> **linkName** — name of the link the handle is attached to, <br> **gripperName** — name of the gripper, <br> **pose** — pose of the gripper in the link frame (SE3), <br> **clearance** — clearance of the gripper, the sum of handle and gripper clearances <br> defines the distance between pregrasp and grasp. |
| `addHandle` | Add a handle to the kinematic chain <br> *Input:* <br> **linkName** — name of the link the handle is attached to, <br> **handleName** — name of the handle, <br> **pose** — pose of the handle in the link frame (SE3), <br> **clearance** — clearance of the handle, the sum of handle and gripper clearances <br> defines the distance between pregrasp and grasp, <br> **mask** — list of 6 Boolean use to define symmetries in the grasp constraint. |
| `contactSurfaceNames` | Return list of contact surface names registered on device |
| `contactSurfaces` | Return dict mapping surface names to list of {joint, points} |
| `getJointConfig` | Return current configuration values of the named joint. |
| `getJointNames` | Return list of all joint names in the Pinocchio model. |
| `grippers` | Return a map from gripper name to Gripper object. |
| `handles` | Return a map from handle name to Handle object. |
| `modelsInfo` | Return list of modelsInfo stored in the device, each element contains the urdf path, srdf path, prefix and initial pose of a model loaded in the device |
| `setJointBounds` | Set joint bounds from a flat list [min0, max0, min1, max1, ...]. |
| `setRobotRootPosition` | Set the root position of a sub-robot (identified by name) relative to its parent joint. |

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

| Method | Description |
|:---|:---|
| `checkFeasibilityOnly` | If enabled, only add one solution to the roadmap. Otherwise add all solutions. |
| `nDiscreteSteps` | Number of steps to generate goal config (successive projections). |
| `nRandomConfig` | Get the number of random configurations used to generate the initial config of the final path. |

---

## `EndEffectorTrajectorySteeringMethod`

*Inherits: [`pyhpp.core.bindings.SteeringMethod`](core.md#steeringmethod)*

| Method | Description |
|:---|:---|
| `setTrajectory` | Set the right hand side of the trajectory constraint from a path. param se3Output: set to True if the output of path must be understood as SE3. |
| `setTrajectoryConstraint` | Set the constraint whose right hand side will vary along the trajectory. |

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

| Method | Description |
|:---|:---|
| `_get_native_graph` | Return a capsule wrapping the native C++ Graph object (for external interop). |
| `addLevelSetFoliation` | Add the numerical constraints to a LevelSetTransition that create the foliation. |
| `addNumericalConstraint` | Add a numerical constraint to a state. |
| `addNumericalConstraintsForPath` | Add numerical constraints for path to a state. |
| `addNumericalConstraintsToGraph` | Add a list of numerical constraints to all transitions in the graph. |
| `addNumericalConstraintsToState` | Add numerical constraints to a state. |
| `addNumericalConstraintsToTransition` | Add numerical constraints to a TRANSITION. |
| `applyLeafConstraints` | Apply transition constraints to a configuration. Returns tuple with success flag, output configuration, and error norm. If success, the output configuration is reachable from q_rhs along the transition. |
| `applyStateConstraints` | Apply constraints to a configuration. Returns tuple with success flag, output configuration, and error norm. |
| `createGraspConstraint` | Create grasp, complement and hold constraints for a gripper-handle pair. Returns a list [grasp, complement, hold]. |
| `createLevelSetTransition` | Create a LevelSetTransition. See documentation of class hpp::manipulation::graph::LevelSetEdge for more information. |
| `createPlacementConstraint` | Create placement constraint between object surfaces and environment surfaces. Creates constraints that ensure proper contact between object and environment. |
| `createPreGraspConstraint` | Create a pre-grasp constraint for a gripper-handle pair. |
| `createPrePlacementConstraint` | Create pre-placement constraint with specified width margin. Used for approaching placement configurations before final placement. |
| `createState` | Create one or several states. The order is important - the first should be the most restrictive one as a configuration will be in the first state for which the constraints are satisfied. |
| `createSubGraph` | Create a subgraph with guided state selection. |
| `createTransition` | Create a transition. The weights define the probability of selecting a transition among all the outgoing transitions of a state. The probability of a transition is w_i / sum(w_j), where each w_j corresponds to an outgoing transition from a given state. To have a transition that cannot be selected by the M-RRT algorithm but is still acceptable, set its weight to zero. |
| `createWaypointTransition` | Create a WaypointTransition. See documentation of class hpp::manipulation::graph::WaypointEdge for more information. |
| `display` | Display the current graph. The graph is printed in DOT format. |
| `displayStateConstraints` | Print set of constraints relative to a state in a string. |
| `displayTransitionConstraints` | Print set of constraints relative to a transition in a string. |
| `displayTransitionTargetConstraints` | Print set of constraints relative to a transition in a string. |
| `errorThreshold` | Get error threshold in config projector. |
| `errorThreshold` | Set error threshold. |
| `generateTargetConfig` | Generate configuration in destination state on a given leaf. Returns tuple with success flag, output configuration, and error norm. Computes a configuration in the destination state of the transition, reachable from q_rhs. |
| `getConfigErrorForState` | Get error of a config with respect to a state constraint. Returns whether the configuration belongs to the state. Calls core::ConstraintSet::isSatisfied for the state constraints. |
| `getConfigErrorForTransition` | Get error of a config with respect to a transition constraint. Returns whether the configuration belongs to the transition. Calls core::ConfigProjector::rightHandSideFromConfig with the input configuration and then core::ConstraintSet::isSatisfied on the transition constraints. |
| `getConfigErrorForTransitionLeaf` | Get error of a config with respect to a transition foliation leaf. Returns whether config can be the end point of a path of the transition starting at leafConfig. |
| `getConfigErrorForTransitionTarget` | Get error of a config with respect to the target of a transition foliation leaf. Returns whether config can be the end point of a path of the transition starting at leafConfig. |
| `getContainingNode` | Get the name of the state in which a transition is. Paths satisfying the transition constraints satisfy the state constraints. |
| `getNodesConnectedByTransition` | Get the names of the states connected by a transition. |
| `getNumericalConstraintsForEdge` | Get numerical constraints of an edge. |
| `getNumericalConstraintsForGraph` | Get numerical constraints of the graph. |
| `getNumericalConstraintsForState` | Get numerical constraints of a state. |
| `getRelativeMotionMatrix` | Get relative motion matrix for a transition as list of lists. |
| `getSecurityMarginMatrixForTransition` | Get security margin matrix for a transition as list of lists. |
| `getState` | Return the state with the given name. |
| `getStateFromConfiguration` | Get the name of the state corresponding to the configuration. |
| `getStateNames` | Return a list of state names. |
| `getStates` | Return a list of all states in the constraint graph. |
| `getTransition` | Return the transition with the given name. |
| `getTransitionNames` | Return a list of transition names. |
| `getTransitions` | Return a list of all transitions in the constraint graph. |
| `getWeight` | Get weight of a transition. |
| `initialize` | Initialize the graph. Performs final initialization of the constraint graph. |
| `isShort` | Check if a transition is short. |
| `maxIterations` | Get maximal number of iterations in config projector. |
| `maxIterations` | Set maximal number of iterations. |
| `registerConstraints` | Register constraints in the graph. |
| `removeCollisionPairFromTransition` | Remove collision pairs from a transition. |
| `resetConstraints` | Reset constraints of a state. |
| `setContainingNode` | Set in which state a transition is. Paths satisfying the transition constraints satisfy the state constraints. |
| `setSecurityMarginForTransition` | Set collision security margin for a pair of joints along a transition. |
| `setShort` | Set that a transition is short. When a transition is tagged as short, extension along this transition is done differently in RRT-like algorithms. Instead of projecting a random configuration in the destination state, the configuration to extend itself is projected in the destination state. This makes the rate of success higher. |
| `setTargetNodeList` | Set the target state list for guided state selection. |
| `setWaypoint` | Set waypoint configuration for a waypoint transition. Configures which edge and state to use at the specified waypoint index. |
| `setWeight` | Set weight of a transition. You cannot set weight for waypoint transitions. |
| `transitionAtParam` | Return the transition used at a given parameter on a path (static method). |
| `robot` *(property)* | The robot device of the constraint graph. |

---

## `Handle`

*Not instantiable from Python.*

> Frame attached to an object that is aimed at being grasped
>
> Together with a hpp::pinocchio::Gripper, a handle defines a grasp. A vector of 6 Boolean values called a mask can be passed to the constructor to define the symmetries of the handle. For example, {True,True,True,False,True,True} means that the handle can be grasped with free orientation around x-axis. See https://hal.laas.fr/hal-02995125v2 for details. The setter method mask allows users to define the mask.
>
> Along motions where the handle is grasped by a gripper, an additional constraint is enforced, called the complement constraint. This latter constraint ensures that the object is rigidly fixed to the gripper.
>
> However, for some applications, the complement constraint can be customized using setter maskComp. Note that calling setter method mask reinitializes the mask complement.

| Method | Description |
|:---|:---|
| `createGrasp` | **gripper** — object containing the gripper information |
| `createGraspAndComplement` | **gripper** — object containing the gripper information |
| `createGraspComplement` | **gripper** — object containing the gripper information |
| `createPreGrasp` | **gripper** — object containing the gripper information |
| `getParentJointId` | Get index of the joint the handle is attached to in pinocchio Model |
| `approachingDirection` *(property)* | Approaching direction for pregrasp (unit vector in handle frame, default is x-axis). |
| `clearance` *(property)* | Distance from the center of the gripper along x-axis that ensures no collision. Also gives an order of magnitude of the gripper size. |
| `localPosition` *(property)* | Local position of the handle in the joint frame. |
| `mask` *(property)* | Constraint mask: vector&lt;bool&gt; of size 6 defining the symmetries of the handle. See Handle class documentation for details. |
| `maskComp` *(property)* | Mask of the complement constraint. |
| `name` *(property)* | Name of the handle. |

---

## `Problem`

*Inherits: [`pyhpp.core.bindings.Problem`](core.md#problem)*

| Method | Description |
|:---|:---|
| `checkProblem` | Check whether the problem is well formulated. |
| `constraintGraph` | Get the graph of constraints. |
| `constraintGraph` | Set the graph of constraints. |
| `fullSteeringMethod` | Set the problem steering method directly. Unlike steeringMethod, this does not wrap the given steering method in a manipulation graph steering method. |
| `steeringMethod` | Get the inner steering method (unwrapped from the graph steering method if applicable). |
| `steeringMethod` | Set the steering method. |

---

## `State`

*Not instantiable from Python.*

> State of an end-effector.
>
> States of the graph of constraints. There is one graph for each end-effector.

| Method | Description |
|:---|:---|
| `id` | Return the component id. |
| `name` | Get the component name. |
| `neighborEdges` | Get the list of edges connected to this state. |

---

## `Transition`

*Not instantiable from Python.*

> Transition between two states of a constraint graph
>
> An edge stores two types of constraints.
>
> Path constraints  should be safisfied by paths belonging to the edge. Along any path, the right hand side of the constraint is constant, but can differ between paths. For instance if an edge represents a transit path of a robot that can grasp an object, the right hand side of the constraint represents the position of the object. Along any transit path, the object does not move, but for different paths the object can be at different positions. method pathConstraint.
>
> Configuration constraints  are constraints that configurations in the destination state should satisfy and the constraints that paths should satisfy. For instance, if the edge links a state where the robot does not hold the object to a state where the robot holds the object, the configuration constraints represent a fixed relative position of the object with respect to the gripper and a stable position of the object. Configuration constraints are necessary to generate a configuration in the destination state of the edge that is reachable from a given configuration in the start state by an admissible path.

| Method | Description |
|:---|:---|
| `id` | Return the component id. |
| `isWaypointTransition` | **Error** — Could not find member (.*) isWaypointEdge of class hpp::manipulation::graph::Edge |
| `name` | Get the component name. |
| `nbWaypoints` | **Error** — Could not find member (.*) nbWaypoints of class hpp::manipulation::graph::Edge |
| `nbWaypoints` | **Error** — Could not find member (.*) nbWaypoints of class hpp::manipulation::graph::Edge |
| `pathValidation` | Get path validation associated to the edge. |
| `waypoint` | **Error** — Could not find member (.*) waypoint of class hpp::manipulation::graph::Edge |

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

| Method | Description |
|:---|:---|
| `clearPathOptimizers` | Clear path optimizers. |
| `directPath` | Compute a direct path on a transition. Returns (success, path, status). |
| `innerPlanner` | Get the inner planner. |
| `innerPlanner` | Set the inner planner. |
| `innerProblem` | Get the inner problem. |
| `optimizePath` | :param :input path |
| `pathProjector` | Set the path projector. |
| `planPath` | **qInit** — initial configuration, <br> :param qGoals goal:configurations, <br> **resetRoadmap** — whether to reset the roadmap |
| `setEdge` | **id** — index of the transition in the constraint graph |
| `setReedsAndSheppSteeringMethod` | Create a Reeds and Shepp steering method and path it to the problem. |
| `setTransition` | **id** — index of the transition in the constraint graph |
| `timeParameterization` | :param :input path |
| `validateConfiguration` | Validate configuration against the graph state identified by id. Returns (valid, report). |

---
