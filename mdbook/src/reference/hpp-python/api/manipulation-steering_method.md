# `pyhpp.manipulation.steering_method`

## Functions

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">makePiecewiseLinearTrajectory</span>(arg1: numpy.ndarray, arg2: numpy.ndarray) -&gt; <a href="core.md#path">pyhpp.core.bindings.Path</a></code> | Build a piecewise linear path. See C++ documentation of class hpp::manipulation::steeringMethod::Cartesian. |

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

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#problem">pyhpp.core.bindings.Problem</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getRightHandSide</span>(<span class="hljs-params">self</span>) -&gt; <a href="constraints.md#differentiablefunction">pyhpp.constraints.bindings.DifferentiableFunction</a></code> | Get right hand side function of trajectory constraint. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">planPath</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Plan a path starting from an initial configuration. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">setRightHandSide</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#path">pyhpp.core.bindings.Path</a>, arg3: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">setRightHandSide</span>(<span class="hljs-params">self</span>, arg2: <a href="constraints.md#differentiablefunction">pyhpp.constraints.bindings.DifferentiableFunction</a>, arg3: <a href="core.md#interval">pyhpp.core.bindings.interval</a>) -&gt; <span class="hljs-literal">None</span></code> | Set right hand side from a hpp::core::Path |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">timeRange</span>(<span class="hljs-params">self</span>) -&gt; <a href="core.md#interval">pyhpp.core.bindings.interval</a></code> | Get interval of definition of right hand side of trajectory constraint. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(*args, **kwargs)<br><br><span class="hljs-meta">@errorThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(*args, **kwargs)</code> | Error threshold of numerical solver. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(*args, **kwargs)<br><br><span class="hljs-meta">@maxIterations.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(*args, **kwargs)</code> | Maximal number of iterations of numerical solver. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nDiscreteSteps</span>(*args, **kwargs)<br><br><span class="hljs-meta">@nDiscreteSteps.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">nDiscreteSteps</span>(*args, **kwargs)</code> | Number of discretization steps in the interval of definition where configurations are computed. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">trajectoryConstraint</span>(*args, **kwargs)<br><br><span class="hljs-meta">@trajectoryConstraint.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">trajectoryConstraint</span>(*args, **kwargs)</code> | Constraint with a time-varying right hand side. |

---
