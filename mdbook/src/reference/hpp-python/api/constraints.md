# `pyhpp.constraints`

## `BySubstitution`

*Inherits: [`HierarchicalIterative`](#hierarchicaliterative)*

> Solve a non-linear system equations with explicit and implicit constraints
>
> This solver is defined in paper https://hal.archives-ouvertes.fr/hal-01804774/file/paper.pdf. We give here only a brief description
>
> The unknows (denoted by $\mathbf{q}$) of the system of equations is a Lie group. It is usually a robot configuration space or the Cartesian product of robot configuration spaces.
>
> The solver stores a set of implicit numerical constraints: $g_1 (\mathbf{q}) = 0, g_2 (\mathbf{q}) = 0, \cdots$. These implicit constraints are added using method HierarchicalIterative::add.
>
> The solver also stores explicit numerical constraints (constraints where some configuration variables depend on others) in an instance of class ExplicitConstraintSet. This instance is accessible via method BySubstitution::explicitConstraintSet.
>
> When an explicit constraint is added using method ExplicitConstraintSet::add, this method checks that the explicit constraint is compatible with the previously added ones. If so, the constraint is stored in the explicit constraint set. Otherwise, it has to be added as an implicit constraint.
>
> See Section III of the above mentioned paper for the description of the constraint resolution.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="pinocchio.md#liegroupspace">pyhpp.pinocchio.bindings.LiegroupSpace</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">describeError</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Describe the constraint error for configuration q. Returns a list of (constraint_name, error_norm) pairs. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">explicitConstraintSet</span>(<span class="hljs-params">self</span>) -&gt; <a href="#explicitconstraintset">ExplicitConstraintSet</a></code> | Get explicit constraint set. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">explicitConstraintSetHasChanged</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Should be called whenever explicit solver is modified. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSide</span>(<span class="hljs-params">self</span>, arg2: <a href="#implicit">Implicit</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSide</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSide</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | Set right hand side of a constraint. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSideFromConfig</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSideFromConfig</span>(<span class="hljs-params">self</span>, arg2: <a href="#implicit">Implicit</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-built_in">bool</span></code> | Compute right hand side of equality constraints from a configuration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">solve</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">tuple</span></code> | Solve the constraints from configuration q. Returns (output_config, status). |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(*args, **kwargs)<br><br><span class="hljs-meta">@errorThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(*args, **kwargs)</code> | Get error threshold. |

---

## `ComparisonType`

*Inherits: `int`*

---

## `ComparisonTypes`

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

## `DifferentiableFunction`

> Differentiable function from a Lie group, for instance the configuration space of a robot (hpp::pinocchio::Device) to a another Lie group.
>
> Note that the input Lie group is only represented by the sizes of the elements and of the velocities: methods inputSize and inputDerivativeSize
>
> The output space can be accessed by method outputSpace.
>
> The value of the function for a given input can be accessed by method value . The Jacobian of the function for a given input can be accessed by method jacobian .

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">J</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; numpy.ndarray</code> | Compute Jacobian matrix and return as a numpy array. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__call__</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <a href="pinocchio.md#liegroupelement">pyhpp.pinocchio.bindings.LiegroupElement</a></code> | Evaluate the function at a given parameter. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <span class="hljs-built_in">int</span>, arg4: <span class="hljs-built_in">int</span>, arg5: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">impl_compute</span>(<span class="hljs-params">self</span>, arg2: <a href="pinocchio.md#liegroupelementref">pyhpp.pinocchio.bindings.LiegroupElementRef</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">impl_compute</span>(<span class="hljs-params">self</span>, arg2: <a href="pinocchio.md#liegroupelementref">pyhpp.pinocchio.bindings.LiegroupElementRef</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">impl_jacobian</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">impl_jacobian</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">inputDerivativeSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">inputSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Get dimension of input vector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">jacobian</span>(<span class="hljs-params">self</span>, jacobian: numpy.ndarray, argument: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> | :param :jacobian will be stored in this argument **argument** — point at which the jacobian will be computed |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> | Get function name. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">outputDerivativeSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Get dimension of output derivative vector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">outputSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Get dimension of output vector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">outputSpace</span>(<span class="hljs-params">self</span>) -&gt; <a href="pinocchio.md#liegroupspace">pyhpp.pinocchio.bindings.LiegroupSpace</a></code> | Get output space. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">value</span>(<span class="hljs-params">self</span>, result: <a href="pinocchio.md#liegroupelement">pyhpp.pinocchio.bindings.LiegroupElement</a>, argument: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">ndi</span>(*args, **kwargs)</code> | Get dimension of input derivative vector. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">ndo</span>(*args, **kwargs)</code> | Get dimension of output derivative vector. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">ni</span>(*args, **kwargs)</code> | Get dimension of input vector. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">no</span>(*args, **kwargs)</code> | Get dimension of output vector. |

---

## `Explicit`

> Explicit numerical constraint
>
> DefinitionAn explicit numerical constraint is a constraint such that some configuration variables called output are function of the others called input.
>
> Let
>
> $(ic_{1}, \cdots, ic_{n_{ic}})$ be the list of indices corresponding to ordered input configuration variables,
>
> $(oc_{1}, \cdots, oc_{n_{oc}})$ be the list of indices corresponding to ordered output configuration variables,
>
> $(iv_{1}, \cdots, iv_{n_{iv}})$ be the list of indices corresponding to ordered input degrees of freedom,
>
> $(ov_{1}, \cdots, ov_{n_{ov}})$ be the list of indices corresponding to ordered output degrees of freedom.
>
> Recall that degrees of freedom refer to velocity vectors.
>
> Let us notice that $n_{ic} + n_{oc}$ is less than the robot configuration size, and $n_{iv} + n_{ov}$ is less than the velocity size. Some degrees of freedom may indeed be neither input nor output.
>
> Then the differential function is of the form      
>
> $$\begin{align*}\mathbf{q}_{out} - g \left(\mathbf{q}_{in}\right) \ \ &\text{with}& \mathbf{q}_{out} = \left(q_{oc_{1}} \cdots q_{oc_{n_{oc}}}\right)^T, \ \ \ \mathbf{q}_{in} = (q_{ic_{1}} \cdots q_{ic_{n_{ic}}})^T\end{align*}$$
>
>  It is straightforward that an equality constraint with this function can be solved explicitely:     
>
> $$\begin{align*}\mathbf{q}_{out} &- g \left(\mathbf{q}_{in}\right) = rhs \\ & \text{if and only if}\\ \mathbf{q}_{out} &= g \left(\mathbf{q}_{in}\right) + rhs \\\end{align*}$$
>
>
>
> If function $f$ takes values in a Lie group (SO(2), SO(3)), the above "+" between a Lie group element and a tangent vector has to be undestood as the integration of the constant velocity from the Lie group element:   
>
> $$\begin{equation*}\mathbf{q} + \mathbf{v} = \mathbf{q}.\exp (\mathbf{v})\end{equation*}$$
>
>  where $\mathbf{q}$ is a Lie group element and $\mathbf{v}$ is a tangent vector.
>
> Considered as an Implicit instance, the expression of the Jacobian of the DifferentiableFunction above depends on the output space of function $f$. The rows corresponding to values in a vector space are expressed as follows.
>
> for any index $i$ between 0 and the size of velocity vectors, either
>
> $\dot{q}_i$ is an input degree of freedom: $\exists j$ integer, $1 \leq j \leq n_{iv}$ such that $i=iv_{j}$,
>
> $\dot{q}_i$ is an output degree of freedom: $\exists j$ integer, $1\leq j \leq n_{ov}$ such that $i=ov_{j}$, or
>
> $\dot{q}_i$ neither input nor output. In this case, the corresponding column is equal to 0.              
>
> $$\begin{equation*}J = \left(\begin{array}{cccccccccccc} \cdots & ov_1 & \cdots & iv_{1} & \cdots & ov_2 & \cdots & iv_2 & \cdots & ov_{n_{ov}} & \cdots \\ & 1 & & & & 0 & & & & & \\ & 0 & & & & 1 & & & & & \\ & & & -\frac{\partial g}{q_1} & & & & -\frac{\partial g}{q_2} \\ &&&&&\\ & 0 & & & & 0 & & & & 1 \end{array}\right)\end{equation*}$$
>
>  The rows corresponding to values in SO(3) have the following expression.     
>
> $$\begin{equation*}J = \left(\begin{array}{cccccccccccc} ov_1 \ ov_2 \ ov_3 & iv_1 \cdots iv_{n_{iv}} \\ J_{log}(R_{g}^T R_{out}) & -J_{log}(R_{g}^T R_{out})R_{out}^T R_{g} \frac{\partial g}{\partial q_{in}} \end{array}\right)\end{equation*}$$
>
>  where
>
> $R_{out}$ is the rotation matrix corresponding to unit quaternion $(q_{oc1},q_{oc2},q_{oc3},q_{oc4})$,
>
> $R_{g}$ is the rotation matrix corresponding to the part of the output value of $f$ corresponding to SO(3),
>
> $J_{log}$ is the Jacobian matrix of function that associates to a rotation matrix $R$ the vector $\omega$ such that   
>
> $$\begin{equation*}R = \exp (\left[\omega\right]_{\times})\end{equation*}$$
>
>
>
> "Domain ofdefinition" Some explicit constraints might be defined over only a subspace of the input
>
> space. If the input value is not in the definition subspace, the explicit constraint will throw an exception of type FunctionNotDefinedForThisValue.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="pinocchio.md#liegroupspace">pyhpp.pinocchio.bindings.LiegroupSpace</a>, arg3: <a href="#differentiablefunction">DifferentiableFunction</a>, arg4: <span class="hljs-built_in">list</span>, arg5: <span class="hljs-built_in">list</span>, arg6: <span class="hljs-built_in">list</span>, arg7: <span class="hljs-built_in">list</span>, arg8: <a href="#comparisontypes">ComparisonTypes</a>) -&gt; <span class="hljs-built_in">object</span></code> | Create an explicit constraint mapping output DOF from input DOF. |

---

## `ExplicitConstraintSet`

> Set of explicit constraints
>
> This class combines compatible explicit constraints as defined in the following paper published in Robotics Science and System 2018: https://hal.archives-ouvertes.fr/hal-01804774/file/paper.pdf, Section II-B Definition 4.
>
> An explicit constraint $E=(in,out,f)$ on a robot configuration space $\mathcal{C}$ is defined by
>
> a subset of input indices $in\subset\{1,\cdots, \dim\mathcal{C}\}$,
>
> a subset of output indices $out\subset\{1,\cdots, \dim\mathcal{C}\}$,
>
> a smooth mapping $f$ from $\mathbf{R}^{\|in\|}$ to $\mathbf{R}^{\|out\|}$, satisfying the following properties:
>
> $in\cap out
>
> = \emptyset$,
>
> for any $\mathbf{p}\in\mathcal{C}$,  $\mathbf{q} =
>
> E(\mathbf{p})$ is defined by    
>
> $$\begin{align}&\mathbf{q}_{\bar{out}} = \mathbf{p}_{\bar{out}}\\ &\mathbf{q}_{out} = f (\mathbf{p}_{in}).\end{align}$$
>
>
>
> Right hand side.
>
> For manipulation planning, it is useful to handle a parameterizable right hand side $rhs$. The expression above thus becomes
>
>
>
> $$\begin{equation}\mathbf{q}_{out} = f (\mathbf{p}_{in}) + rhs.\end{equation}$$
>
>
>
> The right hand side may be set using the various methods ExplicitConstraintSet::rightHandSide and ExplicitConstraintSet::rightHandSideFromInput.
>
> For some applications like manipulation planning, an invertible function $ g $ (of known inverse $ g^{-1} $) can be specified for each explicit constraint $E$. The above expression then becomes:   
>
> $$\begin{equation}g(\mathbf{q}_{out}) = f(\mathbf{p}_{in}) + rhs\end{equation}$$
>
>
>
> To add explicit constraints, use methods ExplicitConstraintSet::add. If the constraint to add is not compatible with the previous one, this method returns -1.
>
> Method ExplicitConstraintSet::solve solves the explicit constraints.
>
> The combination of compatible explicit constraints is an explicit constraint. As such this class can be considered as an explicit constraint.
>
> We will therefore use the following notation
>
> $in$ for the set of indices of input variables,
>
> $out$ for the set of indices of output variables.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="pinocchio.md#liegroupspace">pyhpp.pinocchio.bindings.LiegroupSpace</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">add</span>(<span class="hljs-params">self</span>, constraint: <a href="#explicit">Explicit</a>) -&gt; <span class="hljs-built_in">int</span></code> | **constraint** — explicit constraint |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |

---

## `HierarchicalIterative`

> Solve a system of non-linear equations on a robot configuration
>
> The non-linear system of equations is built by adding equations with method HierarchicalIterative::add.
>
> Note that a hierarchy between the equations can be provided. In this case, the solver will try to solve the highest priority equations first, and then to solve the lower priority equations. Note that priorities are in decreasing order: 0 has higher priority than 1.
>
> The algorithm used is a Newton-Raphson like algorithm that works as follows: for a single level of priority, let $f (\mathbf{q}) = 0$ be the system of equations where $f$ is a $C^1$ mapping from the robot configuration space to a Lie group space $\mathcal{L}$.
>
> Starting from initial guess $\mathbf{q}_0$, the method HierarchicalIterative::solve builds a sequence of configurations $\mathbf{q}_i$ as follows:     
>
> $$\begin{align*}\mathbf{q}_{i+1} = \mathbf{q}_i - \alpha_i \frac{\partial f}{\partial \mathbf{q}}(\mathbf{q}_i)^{+} f (\mathbf{q}_i)\end{align*}$$
>
>  where
>
> $\frac{\partial f}{\partial \mathbf{q}}(\mathbf{q}_i)^{+}$ is the Moore-Penrose pseudo-inverse of the system Jacobian,
>
> $\alpha_i$ is a sequence of real numbers depending on the line search strategy. Possible line-search strategies are lineSearch::Constant, lineSearch::Backtracking, lineSearch::FixedSequence, lineSearch::ErrorNormBased. until
>
> the residual $\\|f(\mathbf{q})\\|$ is below an error threshold, or
>
> the maximal number of iterations has been reached.
>
> The computation of the direction of descent in the case of multiple level of hierarchy is described in this paper.
>
> The error threshold can be accessed by methods HierarchicalIterative::errorThreshold. The maximal number of iterations can be accessed by methods HierarchicalIterative::maxIterations.
>
> Solving equations one after the other
>
> For some applications, it can be more efficient to solve a set of equations one after the other. In other words, an equation is ignored until the previous one is solved (norm below the threshold). To do so, introduce the equations using method HierarchicalIterative::add with increasing value of priority, and call method HierarchicalIterative::solveLevelByLevel(true). Lie group
>
> The unknowns $\mathbf{q}$ may take values in a more general set than the configuration space of a robot. This set should be a Cartesian product of Lie groups: hpp::pinocchio::LiegroupSpace.
>
> Saturation
>
> Right hand side and comparison types
>
> Instead of $f(\mathbf{q}) = 0$, other constraints can be defined. Several comparison types are available:
>
> **Equality** — $f(\mathbf{q}) = rhs$, where $rhs$ is a parameterizable right hand side,
>
> **EqualToZero** — $f(\mathbf{q}) = 0$,
>
> **Superior** — $f(\mathbf{q}) > 0$
>
> **Inferior** — $f(\mathbf{q}) < 0$ If several constraint are of type equality, the right hand side of the system of equations can be modified by methods HierarchicalIterative::rightHandSideFromInput, HierarchicalIterative::rightHandSide.
>
> Free variables
>
> Some variables can be locked, or computed explicitely. In this case, the iterative resolution will only change the other variables called free variables. methods
>
> freeVariables (const Indices_t& indices) and
>
> freeVariables (const Indices_t& indices).

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="pinocchio.md#liegroupspace">pyhpp.pinocchio.bindings.LiegroupSpace</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">add</span>(<span class="hljs-params">self</span>, constraint: <a href="#implicit">Implicit</a>, priority: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">bool</span></code> | **constraint** — implicit constraint **priority** — level of priority of the constraint: priority are in decreasing order: 0 is the highest priority level, |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">constraintsForPriority</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">list</span></code> | Return list of constraints at the given priority level. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">dimension</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Return total dimension of the active constraints. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">numberStacks</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Return the number of priority stacks. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSide</span>(<span class="hljs-params">self</span>, arg2: <a href="#implicit">Implicit</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSide</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSide</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | Set right hand side of a constraint. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSideFromConfig</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSideFromConfig</span>(<span class="hljs-params">self</span>, arg2: <a href="#implicit">Implicit</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-built_in">bool</span></code> | Compute right hand side of equality constraints from a configuration. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@errorThreshold.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">errorThreshold</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">lastIsOptional</span>(*args, **kwargs)<br><br><span class="hljs-meta">@lastIsOptional.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">lastIsOptional</span>(*args, **kwargs)</code> | Whether the last priority level is treated as optional. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(*args, **kwargs)<br><br><span class="hljs-meta">@maxIterations.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">maxIterations</span>(*args, **kwargs)</code> | Get maximal number of iterations in config projector. |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">solveLevelByLevel</span>(*args, **kwargs)<br><br><span class="hljs-meta">@solveLevelByLevel.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">solveLevelByLevel</span>(*args, **kwargs)</code> | Whether to solve constraints one priority level at a time. |

---

## `Implicit`

> This class represents a parameterizable numerical constraint that compares the output of a function $h$ to a right hand side Lie group element.
>
> Definition
>
> The function $h$ takes input in a configuration space $\mathcal{C}$ and output in a Lie group $\mathbf{L}$,
>
> the dimensions of $\mathbf{L}$ and of its tangent space are respectively $(n_q,n_v)$.
>
> The comparison is represented by a vector $\mathbf{c}$ of dimension $n_v$ with values in enum hpp::constraints::ComparisonType = { $\mathbf{Equality}$, $\mathbf{EqualToZero}$, $\mathbf{Inferior}$, $\mathbf{Superior}$ }.
>
> The right hand side is Lie group element of dimension $n_q$.
>
> Error
>
> A configuration $\mathbf{q}$ is said to satisfy the constraint for a given right hand side if and only if the error $e$ as computed below is smaller in norm than a given threshold.
>
> Let   
>
> $$\Delta = h (\mathbf{q}) - rhs \in \mathbf{R}^{n_v},$$
>
>  for each component $i\in\{0,\cdots,n_v-1\}$,
>
> if $c_i$ is $\mathbf{Inferior}$, $e_i = \max (0,\Delta_i)$,
>
> if $c_i$ is $\mathbf{Superior}$, $e_i = \min (0,\Delta_i)$,
>
> if $c_i$ is $\mathbf{Equality}$, $e_i = \Delta_i$,
>
> if $c_i$ is $\mathbf{EqualToZero}$, $e_i = \Delta_i$.
>
> Mask
>
> A mask is a vector of Boolean values of size $n_v$. Values set to false means that the corresponding component of the error defined above is not taken into account to determine whether the constraint is satisfied. The active rows of the constraint may be accessed via method activeRows.
>
> Parameterizable right hand side
>
> Lines with $\mathbf{Equality}$ comparator in the above definition of the error need a parameter, while lines with comparators $\mathbf{Inferior}$, $\mathbf{Superior}$, or $\mathbf{EqualToZero}$ do not. As a consequence, the right hand side of the constraint is defined by a vector $\lambda$ of parameters of size the number of $\mathbf{Equality}$ occurences in vector $\mathbf{c}$. The right hand side is then defined as in the following example:       
>
> $$rhs = \exp\left(\begin{array}{c}\lambda_1 \\ 0 \\ 0 \\ \lambda_2 \\ \vdots \end{array}\right) \ \ \ \ \mathbf{c} = \left(\begin{array}{c}\mathbf{Equality} \\ \mathbf{EqualToZero} \\ \mathbf{Inferior} \\ \mathbf{Equality} \\ \vdots \end{array}\right)$$
>
>  To retrieve the size of vector $\lambda$, call method Implicit::parameterSize (). To set and get the right hand side value, use method Implicit::rightHandSide.
>
> Time varying right hand side
>
> The right hand side of the constraint may depend on time, for instance if the constraint is associated to a trajectory following task. In this case, the right hand side is a function from $\mathbf{R}$ to $\mathbf{L}$.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="#differentiablefunction">DifferentiableFunction</a>, arg3: <a href="#comparisontypes">ComparisonTypes</a>, arg4: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <span class="hljs-built_in">object</span></code> | Create an implicit constraint from a differentiable function and comparison types. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">comparisonType</span>(<span class="hljs-params">self</span>) -&gt; <a href="#comparisontypes">ComparisonTypes</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">comparisonType</span>(<span class="hljs-params">self</span>, arg2: <a href="#comparisontypes">ComparisonTypes</a>) -&gt; <span class="hljs-literal">None</span></code> | Return the ComparisonType. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">function</span>(<span class="hljs-params">self</span>) -&gt; <a href="#differentiablefunction">DifferentiableFunction</a></code> | Return a reference to function $h$. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getFunctionOutputSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Return the output size of the underlying differentiable function. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameterSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">rightHandSideSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |

---

## `LockedJoint`

*Inherits: [`Implicit`](#implicit)*

> Implementation of constraint specific to a locked joint.
>
> The implicit formulation as defined in class Implicit is given by   
>
> $$\begin{equation}h (\mathbf{q}) = q_{out} - value\end{equation}$$
>
>  where $value$ is an element of the configuration space of the locked joint passed to method create.
>
> Note that $h$ takes values in $\mathbf{R}^{nv}$ where $nv$ is the dimension of the joint tangent space.
>
> The explicit formulation is given by   
>
> $$\begin{equation}q_{out} = value + rhs\end{equation}$$
>
>  where coordinates of $rhs$ corresponding to comparison types different from Equality are set to 0.
>
> As such, the relation between the explicit formulation and the implicit formulation is the default one.

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: <span class="hljs-built_in">str</span>, arg4: numpy.ndarray) -&gt; <span class="hljs-built_in">object</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: <span class="hljs-built_in">str</span>, arg4: numpy.ndarray, arg5: <a href="#comparisontypes">ComparisonTypes</a>) -&gt; <span class="hljs-built_in">object</span></code> | Create a locked joint constraint fixing the named joint to the given configuration. |

---

## `Manipulability`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="#differentiablefunction">DifferentiableFunction</a>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create a manipulability function for the given robot. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">lockJoint</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> | Lock a joint by name so it is excluded from the Jacobian. |

---

## `MinManipulability`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="#differentiablefunction">DifferentiableFunction</a>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create a minimum-manipulability function for the given robot. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">lockJoint</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> | Lock a joint by name so it is excluded from the Jacobian. |

---

## `Orientation`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">int</span>, arg5: pinocchio.pinocchio_pywrap_default.SE3, arg6: pinocchio.pinocchio_pywrap_default.SE3, arg7: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <span class="hljs-built_in">object</span></code> | **name** — name of the constraint, **robot** — device the constraint applies to, **j2** — index of joint that holds frame 2, frame2 (SE3): pose of frame 2 in joint 2, frame1 (SE3): pose of frame 1 in world frame, **mask** — tuple of Boolean. |

---

## `Position`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">int</span>, arg5: pinocchio.pinocchio_pywrap_default.SE3, arg6: pinocchio.pinocchio_pywrap_default.SE3, arg7: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <span class="hljs-built_in">object</span></code> | **name** — name of the constraint, **robot** — device the constraint applies to, **j2** — index of joint that holds frame 2, frame2 (SE3): pose of frame 2 in joint 2, frame1 (SE3): pose of frame 1 in world frame, **mask** — tuple of Boolean. |

---

## `RelativeCom`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

> Constraint on the relative position of the center of mass
>
> The value of the function is defined as the position of the center of mass in the reference frame of a joint.
>
>
>
> $$\begin{align*}\mathbf{f}(\mathbf{q}) &=& R^T \left(\mathbf{x} - \mathbf{t}\right) - \mathbf{x}^{*}\\ \mathbf{\dot{f}} &=& R^T \left( J_{com} + [\mathbf{x}-\mathbf{t}]_{\times}J_{joint}^{\omega} - J_{joint}^{\mathbf{v}}\right)\mathbf{\dot{q}}\end{align*}$$
>
>
>
> where
>
>
>
> $$\left(\begin{array}{cc} R & \mathbf{t} \\ 0 & 1\end{array}\right)$$
>
>  is the position of the joint,
>
> $\mathbf{x}$ is the position of the center of mass,
>
> $\mathbf{x}^{*}$ is the desired position of the center of mass expressed in joint frame.

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, robot: <span class="hljs-built_in">object</span>, joint: <span class="hljs-built_in">object</span>, reference: numpy.ndarray, mask: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <a href="#relativecom">RelativeCom</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: <span class="hljs-built_in">object</span>, arg4: numpy.ndarray, arg5: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <a href="#relativecom">RelativeCom</a><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">object</span>, arg5: numpy.ndarray, arg6: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <a href="#relativecom">RelativeCom</a></code> | Return a shared pointer to a new instance. |

---

## `RelativeOrientation`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">int</span>, arg5: <span class="hljs-built_in">int</span>, arg6: pinocchio.pinocchio_pywrap_default.SE3, arg7: pinocchio.pinocchio_pywrap_default.SE3, arg8: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <span class="hljs-built_in">object</span></code> | **name** — name of the constraint, **robot** — device the constraint applies to, **j1** — index of joint that holds frame 1, **j2** — index of joint that holds frame 2, frame1 (SE3): pose of frame 1 in joint 1, frame2 (SE3): pose of frame 2 in joint 2, **mask** — tuple of Boolean. |

---

## `RelativePosition`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">int</span>, arg5: <span class="hljs-built_in">int</span>, arg6: pinocchio.pinocchio_pywrap_default.SE3, arg7: pinocchio.pinocchio_pywrap_default.SE3, arg8: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <span class="hljs-built_in">object</span></code> | **name** — name of the constraint, **robot** — device the constraint applies to, **j1** — index of joint that holds frame 1, **j2** — index of joint that holds frame 2, frame1 (SE3): pose of frame 1 in joint 1, frame2 (SE3): pose of frame 2 in joint 2, **mask** — tuple of Boolean. |

---

## `RelativeTransformation`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">int</span>, arg5: <span class="hljs-built_in">int</span>, arg6: pinocchio.pinocchio_pywrap_default.SE3, arg7: pinocchio.pinocchio_pywrap_default.SE3, arg8: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <span class="hljs-built_in">object</span></code> | **name** — name of the constraint, **robot** — device the constraint applies to, **j1** — index of joint that holds frame 1, **j2** — index of joint that holds frame 2, frame1 (SE3): pose of frame 1 in joint 1, frame2 (SE3): pose of frame 2 in joint 2, **mask** — tuple of Boolean. |

---

## `RelativeTransformationR3xSO3`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">int</span>, arg5: <span class="hljs-built_in">int</span>, arg6: pinocchio.pinocchio_pywrap_default.SE3, arg7: pinocchio.pinocchio_pywrap_default.SE3, arg8: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <span class="hljs-built_in">object</span></code> | **name** — name of the constraint, **robot** — device the constraint applies to, **j1** — index of joint that holds frame 1, **j2** — index of joint that holds frame 2, frame1 (SE3): pose of frame 1 in joint 1, frame2 (SE3): pose of frame 2 in joint 2, **mask** — tuple of Boolean. |

---

## `SolverStatus`

*Inherits: `int`*

---

## `Transformation`

*Inherits: [`DifferentiableFunction`](#differentiablefunction)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">object</span>, arg4: <span class="hljs-built_in">int</span>, arg5: pinocchio.pinocchio_pywrap_default.SE3, arg6: pinocchio.pinocchio_pywrap_default.SE3, arg7: pinocchio.pinocchio_pywrap_default.StdVec_Bool) -&gt; <span class="hljs-built_in">object</span></code> | **name** — name of the constraint, **robot** — device the constraint applies to, **j2** — index of joint that holds frame 2, frame2 (SE3): pose of frame 2 in joint 2, frame1 (SE3): pose of frame 1 in world frame, **mask** — tuple of Boolean. |

---

## `segment`

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">first</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@first.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">first</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">second</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@second.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">second</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |

---
