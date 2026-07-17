# `pyhpp.core`

## Functions

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">DiscretizedCollision</span>(robot: <span class="hljs-built_in">object</span>, stepSize: <span class="hljs-built_in">float</span>) -&gt; <a href="#discretized">Discretized</a></code> | Create a discretized collision-checking path validation. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">DiscretizedCollisionAndJointBound</span>(robot: <span class="hljs-built_in">object</span>, stepSize: <span class="hljs-built_in">float</span>) -&gt; <a href="#discretized">Discretized</a></code> | Create a discretized path validation checking both collision and joint bounds. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">DiscretizedJointBound</span>(robot: <span class="hljs-built_in">object</span>, stepSize: <span class="hljs-built_in">float</span>) -&gt; <a href="#discretized">Discretized</a></code> | Create a discretized joint-bound path validation. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">NoneProjector</span>(distance: <a href="#distance">Distance</a>, steeringMethod: <a href="#steeringmethod">SteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <a href="#pathprojector">PathProjector</a></code> | Return a null path projector (no projection). |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">create</span>(arg1: <span class="hljs-built_in">float</span>, arg2: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <a href="#pathwrap">PathWrap</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getVerbosityLevel</span>() -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setVerbosityLevel</span>(arg1: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

## `BiRRTPlanner`

*Inherits: [`PathPlanner`](#pathplanner)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `BiRrtStar`

*Inherits: [`PathPlanner`](#pathplanner)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `CollisionPathValidationReport`

*Inherits: [`CollisionValidationReport`](#collisionvalidationreport)*

> hpp::core::CollisionPathValidationReport

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |

---

## `CollisionValidationReport`

*Inherits: [`ValidationReport`](#validationreport)*

> hpp::core::CollisionValidationReport

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">object1</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">object2</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">result</span>(<span class="hljs-params">self</span>) -&gt; coal.coal_pywrap.CollisionResult</code> |  |

---

## `ConfigProjector`

*Inherits: [`Constraint`](#constraint)*

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

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: <span class="hljs-built_in">str</span>, arg4: <span class="hljs-built_in">float</span>, arg5: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">add</span>(<span class="hljs-params">self</span>, numericalConstraint: <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a>, priority: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">bool</span></code> | **numericalConstraint** — The numerical constraint. **priority** — priority of the function. The last level might be optional. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span></code> | Set error threshold. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">lastIsOptional</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">lastIsOptional</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> | Get whether the last priority level is treated as optional. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> | Get maximal number of iterations in config projector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">numericalConstraints</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return the list of numerical constraints held by this projector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">residualError</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setRightHandSideFromConfig</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> | Set right-hand side of all constraints from a configuration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setRightHandSideOfConstraint</span>(<span class="hljs-params">self</span>, arg2: <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> | Set right-hand side of a specific constraint from a configuration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">sigma</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">solver</span>(<span class="hljs-params">self</span>) -&gt; <a href="constraints.md#bysubstitution">pyhpp.constraints.bindings.BySubstitution</a></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">lineSearchType</span>(*args, **kwargs)<br><br><span class="hljs-meta">@lineSearchType.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">lineSearchType</span>(*args, **kwargs)</code> | Get/set the line search type. |

---

## `ConfigValidation`

> Abstraction of configuration validation
>
> Instances of this class validate configurations with respect to some criteria

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">validate</span>(<span class="hljs-params">self</span>, config: numpy.ndarray, validationReport: <a href="#validationreport">ValidationReport</a>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">validate</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | **config** — the config to check for validity, **validationReport** — report on validation. If non valid, a validation report will be allocated and returned via this shared pointer. |

---

## `ConfigValidations`

*Inherits: [`ConfigValidation`](#configvalidation)*

> Validate a configuration with respect to collision

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">add</span>(<span class="hljs-params">self</span>, configValidation: <a href="#configvalidation">ConfigValidation</a>) -&gt; <span class="hljs-literal">None</span></code> | Add a configuration validation object. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">clear</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Remove all config validations. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">numberConfigValidations</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Return the number of config validations. |

---

## `ConfigurationShooter`

> Abstraction of configuration shooter
>
> Configuration shooters are used by random sampling algorithms to generate new configurations

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">shoot</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | Shoot a random configuration. |

---

## `ConnectedComponent`

> Connected component
>
> Set of nodes reachable from one another.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__eq__</span>(<span class="hljs-params">self</span>, arg2: <a href="#connectedcomponent">ConnectedComponent</a>) -&gt; <span class="hljs-built_in">bool</span></code> | Return true if both objects refer to the same connected component. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">nodes</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Access to the nodes. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">reachableFrom</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">reachableTo</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> |  |

---

## `Constraint`

> Constraint applicable to a robot configuration
>
> Constraint::apply takes as input a configuration and changes it into a configuration satisfying the constraint.
>
> User should define impl_compute in derived classes.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">apply</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">bool</span></code> | Apply constraint to q in-place. Returns true on success. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">copy</span>(<span class="hljs-params">self</span>) -&gt; <a href="#constraint">Constraint</a></code> | Return a copy of this constraint. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">isSatisfied</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">isSatisfied</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray) -&gt; <span class="hljs-built_in">bool</span></code> | Return true if configuration q satisfies the constraint. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> | Get name of constraint. |

---

## `ConstraintSet`

*Inherits: [`Constraint`](#constraint)*

> Set of constraints applicable to a robot configuration
>
> If the set is to contain a ConfigProjector and several LockedJoint instances, the configProjector should be inserted first since following numerical projections might affect locked degrees of freedom.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addConstraint</span>(<span class="hljs-params">self</span>, constraint: <a href="#constraint">Constraint</a>) -&gt; <span class="hljs-literal">None</span></code> | Add a constraint to the set. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">configProjector</span>(<span class="hljs-params">self</span>) -&gt; <a href="#configprojector">ConfigProjector</a></code> | Return pointer to config projector if any. |

---

## `Dichotomy`

*Inherits: [`PathValidation`](#pathvalidation)*

> Abstraction of path validation
>
> Instances of this class compute the latest valid configuration along a path.
>
> Method validate(ConfigurationIn_tq)
>
> is provided to validate single configurations. It is particularly useful to test the initial and goal configurations of a path planning problem using this path validation.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, robot: <span class="hljs-built_in">object</span>, tolerance: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create a dichotomy-based continuous path validation. |

---

## `DichotomyProjector`

*Inherits: [`PathProjector`](#pathprojector)*

> This class projects a path using constraints.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, distance: <a href="#distance">Distance</a>, steeringMethod: <a href="#steeringmethod">SteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create a dichotomy-based path projector with the given step size. |

---

## `DiffusingPlanner`

*Inherits: [`PathPlanner`](#pathplanner)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `Discretized`

*Inherits: [`PathValidation`](#pathvalidation)*

> Abstraction of path validation
>
> Instances of this class compute the latest valid configuration along a path.
>
> Method validate(ConfigurationIn_tq)
>
> is provided to validate single configurations. It is particularly useful to test the initial and goal configurations of a path planning problem using this path validation.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, robot: <span class="hljs-built_in">object</span>, stepSize: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create a discretized collision-checking path validation. |

---

## `Distance`

> Abstract class for distance between configurations.

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">compute</span>(self_: <a href="#weigheddistance">WeighedDistance</a>, q1: numpy.ndarray, q2: numpy.ndarray) -&gt; <span class="hljs-built_in">float</span></code> |  |

---

## `Dubins`

*Inherits: [`SteeringMethod`](#steeringmethod)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `GlobalProjector`

*Inherits: [`PathProjector`](#pathprojector)*

> This class projects a path using constraints.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, distance: <a href="#distance">Distance</a>, steeringMethod: <a href="#steeringmethod">SteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create a global path projector with the given step size. |

---

## `Hermite`

*Inherits: [`SteeringMethod`](#steeringmethod)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `JointBoundValidationReport`

*Inherits: [`ValidationReport`](#validationreport)*

> report returned when a configuration is not within the bounds

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">joint_</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">lowerBound_</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rank_</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">upperBound_</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">value_</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span></code> |  |

---

## `Kinodynamic`

*Inherits: [`SteeringMethod`](#steeringmethod)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `LineSearchType`

*Inherits: `int`*

---

## `Node`

> Node of a roadmap
>
> Stores a configuration.

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <a href="#connectedcomponent">ConnectedComponent</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addInEdge</span>(<span class="hljs-params">self</span>, edge: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addOutEdge</span>(<span class="hljs-params">self</span>, edge: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">configuration</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">connectedComponent</span>(<span class="hljs-params">self</span>) -&gt; <a href="#connectedcomponent">ConnectedComponent</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">connectedComponent</span>(<span class="hljs-params">self</span>, arg2: <a href="#connectedcomponent">ConnectedComponent</a>) -&gt; <span class="hljs-literal">None</span></code> | Return the connected component the node belongs to. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">inEdges</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> | Access to inEdges. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">isInNeighbor</span>(<span class="hljs-params">self</span>, n: <a href="#node">Node</a>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">isOutNeighbor</span>(<span class="hljs-params">self</span>, n: <a href="#node">Node</a>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">outEdges</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> | Access to outEdges. |

---

## `Parameter`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <a href="#parameter">Parameter</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">boolValue</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span></code> | Return the boolean value of this parameter. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">create_bool</span>(arg1: <span class="hljs-built_in">bool</span>) -&gt; <a href="#parameter">Parameter</a></code> | Create a Parameter holding a boolean value. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">floatValue</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span></code> | Return the floating-point value of this parameter. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">intValue</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Return the integer value of this parameter. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">matrixValue</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | Return the matrix value of this parameter. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">stringValue</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> | Return the string value of this parameter. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">value</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> | Return the parameter value as a Python object (bool, int, float, str, numpy array). |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">vectorValue</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | Return the vector value of this parameter. |

---

## `PartialShortcut`

*Inherits: [`PathOptimizer`](#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |

---

## `Path`

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

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__call__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">tuple</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__call__</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">bool</span></code> | Evaluate path at parameter t. Returns (configuration, success). |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">constraints</span>(<span class="hljs-params">self</span>) -&gt; <a href="#constraintset">ConstraintSet</a></code> | Return the constraint set attached to the path, or None. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">copy</span>(<span class="hljs-params">self</span>) -&gt; <a href="#path">Path</a></code> | Return a shared pointer to a copy of this. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">derivative</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>, arg3: <span class="hljs-built_in">int</span>) -&gt; numpy.ndarray</code> | Compute derivative of given order at parameter t. Returns a numpy vector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">end</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | Get the final configuration. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">eval</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">tuple</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">eval</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">bool</span></code> | Evaluate path at parameter t. Returns (configuration, success). |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">extract</span>(<span class="hljs-params">self</span>, self_: <span class="hljs-built_in">float</span>, subInterval: <span class="hljs-built_in">float</span>) -&gt; <a href="#path">Path</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">extract</span>(<span class="hljs-params">self</span>, arg2: <a href="#interval">interval</a>) -&gt; <a href="#path">Path</a></code> | **subInterval** — interval of definition of the extract path If upper bound of subInterval is smaller than lower bound, result is reversed. :param :is thrown when an end configuration of the returned path could not be computed due to projection failure. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">initial</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | Get the initial configuration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">length</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span></code> | Get length of definition interval. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">outputDerivativeSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Get size of velocity. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">outputSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Get size of configuration space. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">paramRange</span>(<span class="hljs-params">self</span>) -&gt; <a href="#interval">interval</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">reverse</span>(<span class="hljs-params">self</span>) -&gt; <a href="#path">Path</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">timeRange</span>(<span class="hljs-params">self</span>) -&gt; <a href="#interval">interval</a></code> | Get interval of definition. |

---

## `PathOptimizer`

> Abstraction of path optimizer

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">interrupt</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Interrupt path optimization. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(<span class="hljs-params">self</span>, n: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> | Set maximal number of iterations. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">optimize</span>(<span class="hljs-params">self</span>, path: <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> | Optimize path. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">problem</span>(<span class="hljs-params">self</span>) -&gt; <a href="#cppcoreproblem">CppCoreProblem</a></code> | Get problem. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">timeOut</span>(<span class="hljs-params">self</span>, timeOut: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> | set time out (in seconds) |

---

## `PathPlanner`

> Path planner
>
> Algorithm that computes a path between an initial configuration and a set of goal configurations.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">computePath</span>(<span class="hljs-params">self</span>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> | Find a path in the roadmap and transform it in trajectory. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">finishSolve</span>(<span class="hljs-params">self</span>, path: <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> | Post processing of the resulting path. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">interrupt</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Interrupt path planning. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> | Get maximal number of iterations. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">oneStep</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | User implementation of one step of resolution. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">problem</span>(<span class="hljs-params">self</span>) -&gt; <a href="#cppcoreproblem">CppCoreProblem</a></code> | Get problem. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">roadmap</span>(<span class="hljs-params">self</span>) -&gt; <a href="#roadmap">Roadmap</a></code> | Get roadmap. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">solve</span>(<span class="hljs-params">self</span>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">startSolve</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">stopWhenProblemIsSolved</span>(<span class="hljs-params">self</span>, enable: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">timeOut</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">timeOut</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> | Get time out. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">tryConnectInitAndGoals</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Try to connect initial and goal configurations to existing roadmap. |

---

## `PathProjector`

> This class projects a path using constraints.

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">apply</span>(<span class="hljs-params">self</span>, path: <a href="#path">Path</a>, projection: <a href="#path">Path</a>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">apply</span>(<span class="hljs-params">self</span>, arg2: <a href="#path">Path</a>) -&gt; <span class="hljs-built_in">tuple</span></code> | **the** — input path, **the** — output path. |

---

## `PathValidation`

> Abstraction of path validation
>
> Instances of this class compute the latest valid configuration along a path.
>
> Method validate(ConfigurationIn_tq)
>
> is provided to validate single configurations. It is particularly useful to test the initial and goal configurations of a path planning problem using this path validation.

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">validate</span>(<span class="hljs-params">self</span>, path: <a href="#path">Path</a>, reverse: <span class="hljs-built_in">bool</span>, validPart: <a href="#path">Path</a>, report: <a href="#pathvalidationreport">PathValidationReport</a>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">validate</span>(<span class="hljs-params">self</span>, arg2: <a href="#path">Path</a>, arg3: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-built_in">tuple</span></code> | :param :the path to check for validity, **reverse** — if true check from the end, **the** — extracted valid part of the path, pointer to path if path is valid. **report** — information about the validation process. A report is allocated if the path is not valid. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">validateConfiguration</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Validate a configuration; returns (valid, report). |

---

## `PathValidationReport`

*Inherits: [`ValidationReport`](#validationreport)*

> hpp::core::PathValidationReport

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">configurationReport</span>(<span class="hljs-params">self</span>) -&gt; <a href="#validationreport">pyhpp.core.bindings.ValidationReport</a><br><br><span class="hljs-meta">@configurationReport.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">configurationReport</span>(<span class="hljs-params">self</span>, arg2: <a href="#validationreport">pyhpp.core.bindings.ValidationReport</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameter</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@parameter.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameter</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `PathWrap`

*Inherits: [`Path`](#path)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="#interval">interval</a>, arg3: <span class="hljs-built_in">int</span>, arg4: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">copy</span>(<span class="hljs-params">self</span>) -&gt; <a href="#path">Path</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">copy</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">copy_constrained</span>(<span class="hljs-params">self</span>, arg2: <a href="#constraintset">ConstraintSet</a>) -&gt; <a href="#path">Path</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">copy_constrained</span>(<span class="hljs-params">self</span>, arg2: <a href="#constraintset">ConstraintSet</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">end</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">end</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">impl_compute</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">impl_compute</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">impl_derivative</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">float</span>, arg4: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">impl_derivative</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">float</span>, arg4: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">initPtr</span>(<span class="hljs-params">self</span>, arg2: <a href="#pathwrap">PathWrap</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">initial</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">initial</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reverse</span>(<span class="hljs-params">self</span>) -&gt; <a href="#path">Path</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reverse</span>(<span class="hljs-params">self</span>) -&gt; <a href="#path">Path</a></code> |  |

---

## `PlanAndOptimize`

*Inherits: [`PathPlanner`](#pathplanner)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="#pathplanner">PathPlanner</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

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

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addConfigValidation</span>(<span class="hljs-params">self</span>, configValidation: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> | Add a config validation method. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addGoalConfig</span>(<span class="hljs-params">self</span>, config: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNumericalConstraintsToConfigProjector</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">list</span>, arg4: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNumericalConstraintsToConfigProjector</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> | Add constraints with priorities to the config projector, creating it if needed. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addPartialCom</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> | Create a named partial COM computation from a list of joint names. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">applyConstraints</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Project config onto active constraints. Returns (success, projected_config, residual_error). |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">clearConfigValidations</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">configValidation</span>(<span class="hljs-params">self</span>) -&gt; <a href="#configvalidations">ConfigValidations</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">configValidation</span>(<span class="hljs-params">self</span>, configValidation: <a href="#configvalidations">ConfigValidations</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the config validations object. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">configurationShooter</span>(<span class="hljs-params">self</span>) -&gt; <a href="#configurationshooter">ConfigurationShooter</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">configurationShooter</span>(<span class="hljs-params">self</span>, configurationShooter: <a href="#configurationshooter">ConfigurationShooter</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the configuration shooter. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createComBetweenFeet</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">str</span>, arg4: <span class="hljs-built_in">str</span>, arg5: <span class="hljs-built_in">str</span>, arg6: numpy.ndarray, arg7: numpy.ndarray, arg8: <span class="hljs-built_in">str</span>, arg9: numpy.ndarray, arg10: <span class="hljs-built_in">list</span>) -&gt; <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a></code> | Create an implicit constraint: COM lies between two contact points. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">createRelativeComConstraint</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">str</span>, arg4: <span class="hljs-built_in">str</span>, arg5: numpy.ndarray, arg6: <span class="hljs-built_in">list</span>) -&gt; <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a></code> | Create an implicit constraint: relative COM equals a reference point expressed in a joint frame. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">createTransformationConstraint</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">str</span>, arg4: <span class="hljs-built_in">str</span>, arg5: pinocchio.pinocchio_pywrap_default.SE3, arg6: <span class="hljs-built_in">list</span>) -&gt; <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">createTransformationConstraint</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">str</span>, arg4: <span class="hljs-built_in">str</span>, arg5: pinocchio.pinocchio_pywrap_default.SE3, arg6: pinocchio.pinocchio_pywrap_default.SE3, arg7: <span class="hljs-built_in">list</span>) -&gt; <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a></code> | Create a relative or absolute transformation constraint between two frames, with a 6-bool mask. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">directPath</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray, arg4: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-built_in">tuple</span></code> | Compute a direct path using the steering method. Returns (valid, path, report). |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">distance</span>(<span class="hljs-params">self</span>) -&gt; <a href="#distance">Distance</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">distance</span>(<span class="hljs-params">self</span>, distance: <a href="#distance">Distance</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the distance function. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getConstraints</span>(<span class="hljs-params">self</span>) -&gt; <a href="#constraintset">ConstraintSet</a></code> | Return the active constraint set. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getParameter</span>(<span class="hljs-params">self</span>, name: <span class="hljs-built_in">str</span>) -&gt; <a href="#parameter">Parameter</a></code> | **name** — of the parameter. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getPartialCom</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; numpy.ndarray</code> | Compute and return the position of the named partial center of mass. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">initConfig</span>(<span class="hljs-params">self</span>, self_: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> | Get shared pointer to initial configuration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">isConfigValid</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Validate config against all config validations. Returns (valid, report). |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">pathProjector</span>(<span class="hljs-params">self</span>) -&gt; <a href="#pathprojector">PathProjector</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">pathProjector</span>(<span class="hljs-params">self</span>, pathProjector: <a href="#pathprojector">PathProjector</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the path projector. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">pathValidation</span>(<span class="hljs-params">self</span>) -&gt; <a href="#pathvalidation">PathValidation</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">pathValidation</span>(<span class="hljs-params">self</span>, pathValidation: <a href="#pathvalidation">PathValidation</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the path validation object. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">resetGoalConfigs</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">robot</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> | return shared pointer to robot. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setConstantRightHandSide</span>(<span class="hljs-params">self</span>, arg2: <a href="constraints.md#implicit">pyhpp.constraints.bindings.Implicit</a>, arg3: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> | If constant=True, set comparison type to EqualToZero; otherwise to Equality. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="#constraintset">ConstraintSet</a>) -&gt; <span class="hljs-literal">None</span></code> | Set the active constraint set used by applyConstraints. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">setParameter</span>(<span class="hljs-params">self</span>, name: <span class="hljs-built_in">str</span>, value: <a href="#parameter">Parameter</a>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">setParameter</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">setParameter</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> | **name** — of the parameter. **value** — value of the parameter **std** — :invalid_argument:if a parameter exists but has a different type. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setRightHandSideFromConfig</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> | Update right-hand side of the config projector from a configuration. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">steeringMethod</span>(<span class="hljs-params">self</span>) -&gt; <a href="#steeringmethod">SteeringMethod</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">steeringMethod</span>(<span class="hljs-params">self</span>, arg2: <a href="#steeringmethod">SteeringMethod</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the steering method. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">target</span>(<span class="hljs-params">self</span>) -&gt; <a href="#problemtarget">ProblemTarget</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">target</span>(<span class="hljs-params">self</span>, target: <a href="#problemtarget">ProblemTarget</a>) -&gt; <span class="hljs-literal">None</span></code> | Get the problem target. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(*args, **kwargs)<br><br><span class="hljs-meta">@errorThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(*args, **kwargs)</code> | Error threshold used when creating a new ConfigProjector. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterProjection</span>(*args, **kwargs)<br><br><span class="hljs-meta">@maxIterProjection.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterProjection</span>(*args, **kwargs)</code> | Maximum iterations for projection used when creating a new ConfigProjector. |

---

## `ProblemTarget`

> Problem target
>
> This abstract class defines the goal to be reached by a planning algorithm.

---

## `Progressive`

*Inherits: [`PathValidation`](#pathvalidation)*

> Abstraction of path validation
>
> Instances of this class compute the latest valid configuration along a path.
>
> Method validate(ConfigurationIn_tq)
>
> is provided to validate single configurations. It is particularly useful to test the initial and goal configurations of a path planning problem using this path validation.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, robot: <span class="hljs-built_in">object</span>, tolerance: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create a progressive continuous path validation. |

---

## `ProgressiveProjector`

*Inherits: [`PathProjector`](#pathprojector)*

> This class projects a path using constraints.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, distance: <a href="#distance">Distance</a>, steeringMethod: <a href="#steeringmethod">SteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create a progressive path projector with the given step size. |

---

## `RSTimeParameterization`

*Inherits: [`PathOptimizer`](#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |

---

## `RandomShortcut`

*Inherits: [`PathOptimizer`](#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |

---

## `RecursiveHermiteProjector`

*Inherits: [`PathProjector`](#pathprojector)*

> This class projects a path using constraints.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, distance: <a href="#distance">Distance</a>, steeringMethod: <a href="#steeringmethod">SteeringMethod</a>, step: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create a recursive Hermite path projector with the given step size. |

---

## `ReedsShepp`

*Inherits: [`SteeringMethod`](#steeringmethod)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `Roadmap`

> Roadmap built by random path planning methods Nodes are configurations, paths are collision-free paths.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="#distance">Distance</a>, arg3: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">addEdge</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray, arg4: <a href="#path">Path</a>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">addEdge</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray, arg4: <a href="#path">Path</a>, arg5: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> | Add nodes at from and to, then add a directed edge between them. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addEdges</span>(<span class="hljs-params">self</span>, from_: <a href="#node">Node</a>, to: <a href="#node">Node</a>, path: <a href="#path">Path</a>) -&gt; <span class="hljs-literal">None</span></code> | **from** — first node **to** — second node :param :path going from |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addGoalNode</span>(<span class="hljs-params">self</span>, config: numpy.ndarray) -&gt; <a href="#node">Node</a></code> | **config** — configuration If configuration is already in the roadmap, tag corresponding node as goal node. Otherwise create a new node. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNode</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> | Add a node with the given configuration to the roadmap. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNodeAndEdge</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray, arg4: <a href="#path">Path</a>) -&gt; <span class="hljs-literal">None</span></code> | Add node at 'to' and a single directed edge from the node nearest to 'from'. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addNodeAndEdges</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray, arg4: <a href="#path">Path</a>) -&gt; <span class="hljs-literal">None</span></code> | Add node at 'to' and edges from the node nearest to 'from'. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">clear</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Clear the roadmap by deleting nodes and edges. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">connectedComponentOfNode</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <a href="#connectedcomponent">ConnectedComponent</a></code> | Return the connected component of the node nearest to the given configuration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">connectedComponents</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return list of all connected components. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">distance</span>(<span class="hljs-params">self</span>) -&gt; <a href="#distance">Distance</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getConnectedComponent</span>(<span class="hljs-params">self</span>, arg2: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <a href="#connectedcomponent">ConnectedComponent</a></code> | Return connected component by index. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">goalNodes</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">initNode</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">initNode</span>(<span class="hljs-params">self</span>) -&gt; <a href="#node">Node</a></code> | Set the initial node to the given configuration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">insertPathVector</span>(<span class="hljs-params">self</span>, path: <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a>, backAndForth: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> | **backAndForth** — whether to insert the reverse path as well. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">merge</span>(<span class="hljs-params">self</span>, other: <a href="#roadmap">Roadmap</a>) -&gt; <span class="hljs-literal">None</span></code> | Add the nodes and edges of a roadmap into this one. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nearestNode</span>(*args, **kwargs)</code> | Find nearest node to configuration (optionally searching in reverse direction). Returns (configuration, minDistance). |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nearestNodes</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">object</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nearestNodes</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <a href="#connectedcomponent">ConnectedComponent</a>, arg4: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">object</span></code> | Find the k nearest nodes to configuration. Returns a list of nodes. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">nodes</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return list of all node configurations in the roadmap. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">nodesConnectedComponent</span>(<span class="hljs-params">self</span>, arg2: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <span class="hljs-built_in">list</span></code> | Return list of configurations in the connected component identified by connectedComponentId. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">nodesWithinBall</span>(<span class="hljs-params">self</span>, configuration: numpy.ndarray, connectedComponent: <a href="#connectedcomponent">ConnectedComponent</a>, maxDistance: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">numberConnectedComponents</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Return the number of connected components. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">pathExists</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span></code> | Check that a path exists between the initial node and one goal node. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">resetGoalNodes</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `SearchInRoadmap`

*Inherits: [`PathPlanner`](#pathplanner)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>, arg3: <a href="#roadmap">Roadmap</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `SimpleShortcut`

*Inherits: [`PathOptimizer`](#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |

---

## `SimpleTimeParameterization`

*Inherits: [`PathOptimizer`](#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxAcceleration</span>(*args, **kwargs)<br><br><span class="hljs-meta">@maxAcceleration.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxAcceleration</span>(*args, **kwargs)</code> | The maximum acceleration for each degree of freedom. Not considered if negative. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">order</span>(*args, **kwargs)<br><br><span class="hljs-meta">@order.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">order</span>(*args, **kwargs)</code> | The desired continuity order (0, 1, or 2). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">safety</span>(*args, **kwargs)<br><br><span class="hljs-meta">@safety.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">safety</span>(*args, **kwargs)</code> | A scaling factor for the velocity bounds. |

---

## `Snibud`

*Inherits: [`SteeringMethod`](#steeringmethod)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `SplineBezier3`

*Inherits: [`SteeringMethod`](#steeringmethod)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `SplineBezier5`

*Inherits: [`SteeringMethod`](#steeringmethod)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `SplineGradientBased_bezier1`

*Inherits: [`PathOptimizer`](#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(*args, **kwargs)<br><br><span class="hljs-meta">@QPAccuracy.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(*args, **kwargs)</code> | Accuracy of the QP solver (only used by proxqp). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(*args, **kwargs)<br><br><span class="hljs-meta">@alphaInit.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(*args, **kwargs)</code> | In [0,1]. Initial value when interpolating between non-colliding current solution and the optimal colliding trajectory. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(*args, **kwargs)<br><br><span class="hljs-meta">@alwaysStopAtFirst.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(*args, **kwargs)</code> | If true, consider only one (not all) collision constraint per iteration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(*args, **kwargs)<br><br><span class="hljs-meta">@checkJointBound.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(*args, **kwargs)</code> | If true, joint bounds are enforced. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(*args, **kwargs)<br><br><span class="hljs-meta">@costOrder.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(*args, **kwargs)</code> | Order of the derivative used for the optimized cost function (most likely 1, 2, or 3). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(*args, **kwargs)<br><br><span class="hljs-meta">@costThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(*args, **kwargs)</code> | Stop optimizing if the cost improves less than this threshold between two iterations. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(*args, **kwargs)<br><br><span class="hljs-meta">@guessThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(*args, **kwargs)</code> | Threshold to detect rows of zeros in the Jacobian (passive DoF). Negative disables the check. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(*args, **kwargs)<br><br><span class="hljs-meta">@linearizeAtEachStep.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(*args, **kwargs)</code> | If true, collision constraint will be re-linearized at each iteration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(*args, **kwargs)<br><br><span class="hljs-meta">@reorderIntervals.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(*args, **kwargs)</code> | If true, intervals in collision are checked first at the next iteration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(*args, **kwargs)<br><br><span class="hljs-meta">@returnOptimum.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(*args, **kwargs)</code> | If true, returns the optimum regardless of collision (for debugging). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(*args, **kwargs)<br><br><span class="hljs-meta">@usePathLengthAsWeights.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(*args, **kwargs)</code> | If true, the initial path length is used to weight the splines. |

---

## `SplineGradientBased_bezier3`

*Inherits: [`PathOptimizer`](#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(*args, **kwargs)<br><br><span class="hljs-meta">@QPAccuracy.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(*args, **kwargs)</code> | Accuracy of the QP solver (only used by proxqp). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(*args, **kwargs)<br><br><span class="hljs-meta">@alphaInit.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(*args, **kwargs)</code> | In [0,1]. Initial value when interpolating between non-colliding current solution and the optimal colliding trajectory. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(*args, **kwargs)<br><br><span class="hljs-meta">@alwaysStopAtFirst.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(*args, **kwargs)</code> | If true, consider only one (not all) collision constraint per iteration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(*args, **kwargs)<br><br><span class="hljs-meta">@checkJointBound.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(*args, **kwargs)</code> | If true, joint bounds are enforced. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(*args, **kwargs)<br><br><span class="hljs-meta">@costOrder.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(*args, **kwargs)</code> | Order of the derivative used for the optimized cost function (most likely 1, 2, or 3). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(*args, **kwargs)<br><br><span class="hljs-meta">@costThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(*args, **kwargs)</code> | Stop optimizing if the cost improves less than this threshold between two iterations. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(*args, **kwargs)<br><br><span class="hljs-meta">@guessThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(*args, **kwargs)</code> | Threshold to detect rows of zeros in the Jacobian (passive DoF). Negative disables the check. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(*args, **kwargs)<br><br><span class="hljs-meta">@linearizeAtEachStep.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(*args, **kwargs)</code> | If true, collision constraint will be re-linearized at each iteration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(*args, **kwargs)<br><br><span class="hljs-meta">@reorderIntervals.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(*args, **kwargs)</code> | If true, intervals in collision are checked first at the next iteration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(*args, **kwargs)<br><br><span class="hljs-meta">@returnOptimum.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(*args, **kwargs)</code> | If true, returns the optimum regardless of collision (for debugging). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(*args, **kwargs)<br><br><span class="hljs-meta">@usePathLengthAsWeights.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(*args, **kwargs)</code> | If true, the initial path length is used to weight the splines. |

---

## `SplineGradientBased_bezier5`

*Inherits: [`PathOptimizer`](#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(*args, **kwargs)<br><br><span class="hljs-meta">@QPAccuracy.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">QPAccuracy</span>(*args, **kwargs)</code> | Accuracy of the QP solver (only used by proxqp). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(*args, **kwargs)<br><br><span class="hljs-meta">@alphaInit.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alphaInit</span>(*args, **kwargs)</code> | In [0,1]. Initial value when interpolating between non-colliding current solution and the optimal colliding trajectory. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(*args, **kwargs)<br><br><span class="hljs-meta">@alwaysStopAtFirst.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">alwaysStopAtFirst</span>(*args, **kwargs)</code> | If true, consider only one (not all) collision constraint per iteration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(*args, **kwargs)<br><br><span class="hljs-meta">@checkJointBound.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">checkJointBound</span>(*args, **kwargs)</code> | If true, joint bounds are enforced. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(*args, **kwargs)<br><br><span class="hljs-meta">@costOrder.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costOrder</span>(*args, **kwargs)</code> | Order of the derivative used for the optimized cost function (most likely 1, 2, or 3). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(*args, **kwargs)<br><br><span class="hljs-meta">@costThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">costThreshold</span>(*args, **kwargs)</code> | Stop optimizing if the cost improves less than this threshold between two iterations. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(*args, **kwargs)<br><br><span class="hljs-meta">@guessThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">guessThreshold</span>(*args, **kwargs)</code> | Threshold to detect rows of zeros in the Jacobian (passive DoF). Negative disables the check. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(*args, **kwargs)<br><br><span class="hljs-meta">@linearizeAtEachStep.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">linearizeAtEachStep</span>(*args, **kwargs)</code> | If true, collision constraint will be re-linearized at each iteration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(*args, **kwargs)<br><br><span class="hljs-meta">@reorderIntervals.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reorderIntervals</span>(*args, **kwargs)</code> | If true, intervals in collision are checked first at the next iteration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(*args, **kwargs)<br><br><span class="hljs-meta">@returnOptimum.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">returnOptimum</span>(*args, **kwargs)</code> | If true, returns the optimum regardless of collision (for debugging). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(*args, **kwargs)<br><br><span class="hljs-meta">@usePathLengthAsWeights.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">usePathLengthAsWeights</span>(*args, **kwargs)</code> | If true, the initial path length is used to weight the splines. |

---

## `SteeringMethod`

> Steering method
>
> A steering method creates paths between pairs of configurations for a robot. They are usually used to take into account nonholonomic constraints of some robots

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__call__</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray) -&gt; <a href="#path">Path</a></code> | Compute a path between two configurations using the steering method. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">constraints</span>(<span class="hljs-params">self</span>, constraints: <a href="#constraintset">ConstraintSet</a>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">constraints</span>(<span class="hljs-params">self</span>) -&gt; <a href="#constraintset">ConstraintSet</a></code> | Set constraint set. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">problem</span>(<span class="hljs-params">self</span>) -&gt; <a href="#cppcoreproblem">CppCoreProblem</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">steer</span>(<span class="hljs-params">self</span>, q1: numpy.ndarray, q2: numpy.ndarray) -&gt; <a href="#path">Path</a></code> |  |

---

## `Straight`

*Inherits: [`SteeringMethod`](#steeringmethod)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `StraightPath`

*Inherits: [`Path`](#path)*

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="pinocchio.md#liegroupspace">pyhpp.pinocchio.bindings.LiegroupSpace</a>, arg3: numpy.ndarray, arg4: numpy.ndarray, arg5: <a href="#interval">interval</a>, arg6: <a href="#constraintset">ConstraintSet</a>) -&gt; <span class="hljs-built_in">object</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: numpy.ndarray, arg4: numpy.ndarray, arg5: <a href="#interval">interval</a>, arg6: <a href="#constraintset">ConstraintSet</a>) -&gt; <span class="hljs-built_in">object</span></code> |  |

---

## `TrapezoidalTimeParameterization`

*Inherits: [`PathOptimizer`](#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxAcceleration</span>(*args, **kwargs)<br><br><span class="hljs-meta">@maxAcceleration.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxAcceleration</span>(*args, **kwargs)</code> | Maximum acceleration for each output degree of freedom. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxVelocity</span>(*args, **kwargs)<br><br><span class="hljs-meta">@maxVelocity.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxVelocity</span>(*args, **kwargs)</code> | Maximum velocity for each output degree of freedom. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">minimumDuration</span>(*args, **kwargs)<br><br><span class="hljs-meta">@minimumDuration.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">minimumDuration</span>(*args, **kwargs)</code> | Minimum duration assigned to each non-empty subpath. |

---

## `ValidationReport`

> Abstraction of validation report for paths and configurations
>
> This class is aimed at being derived to store information relative to various Validation derived classes
>
> CollisionValidation,
>
> collision related PathValidation classes.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |

---

## `VisibilityPrmPlanner`

*Inherits: [`PathPlanner`](#pathplanner)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `WeighedDistance`

*Inherits: [`Distance`](#distance)*

> Weighed distance between configurations
>
> Euclidean distance between configurations seen as vectors. Each degree of freedom is weighed by a positive value.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">asDistancePtr_t</span>(<span class="hljs-params">self</span>) -&gt; <a href="#distance">Distance</a></code> | Return a clone of this WeighedDistance as a Distance shared pointer. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getWeights</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | Return the weight vector used when computing distances. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setWeights</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> | Set the weight vector used when computing distances. |

---

## `interval`

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>, arg3: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">first</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@first.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">first</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">second</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@second.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">second</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `kPrmStar`

*Inherits: [`PathPlanner`](#pathplanner)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="manipulation.md#problem">Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---
