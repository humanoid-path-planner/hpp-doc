# `pyhpp.core.path_optimization`

## `LinearConstraint`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addRows</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">computeRank</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">computeSolution</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">concatenate</span>(<span class="hljs-params">self</span>, arg2: <a href="#linearconstraint">LinearConstraint</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">decompose</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>, arg3: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">isSatisfied</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">reduceConstraint</span>(*args, **kwargs)</code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">J</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@J.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">J</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">PK</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">b</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@b.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">b</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rank</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">xSol</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">xStar</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> |  |

---

## `QuadraticProgram`

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="#quadraticprogram">QuadraticProgram</a>, arg3: <a href="#linearconstraint">LinearConstraint</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addRows</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">computeLLT</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">decompose</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">reduced</span>(<span class="hljs-params">self</span>, arg2: <a href="#linearconstraint">LinearConstraint</a>, arg3: <a href="#quadraticprogram">QuadraticProgram</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">solve</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">solve</span>(<span class="hljs-params">self</span>, arg2: <a href="#linearconstraint">LinearConstraint</a>, arg3: <a href="#linearconstraint">LinearConstraint</a>) -&gt; <span class="hljs-built_in">float</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">H</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@H.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">H</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">activeConstraint</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">activeSetSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">b</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@b.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">b</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">bIsZero</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span><br><br><span class="hljs-meta">@bIsZero.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">bIsZero</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">bool</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">dec</span>(<span class="hljs-params">self</span>) -&gt; eigenpy.eigenpy_pywrap.ColPivHhJacobiSVD</code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">llt</span>(<span class="hljs-params">self</span>) -&gt; eigenpy.eigenpy_pywrap.LLT</code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">trace</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">xStar</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> |  |

---

## `Report`

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#pathvalidationreport">pyhpp.core.bindings.PathValidationReport</a>, arg3: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">first</span>(<span class="hljs-params">self</span>) -&gt; <a href="core.md#pathvalidationreport">pyhpp.core.bindings.PathValidationReport</a><br><br><span class="hljs-meta">@first.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">first</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#pathvalidationreport">pyhpp.core.bindings.PathValidationReport</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">second</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span><br><br><span class="hljs-meta">@second.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">second</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `Reports`

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
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">empty</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">extend</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">push_back</span>(<span class="hljs-params">self</span>, arg2: <a href="#report">Report</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">size</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |

---

## `SplineGradientBasedAbstractB1`

*Inherits: [`pyhpp.core.bindings.PathOptimizer`](core.md#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addContinuityConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>, arg3: <span class="hljs-built_in">int</span>, arg4: <a href="#splineoptimizationdatas">SplineGradientBasedAbstractB1.SplineOptimizationDatas</a>, arg5: <a href="#linearconstraint">LinearConstraint</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">appendEquivalentSpline</span>(<span class="hljs-params">self</span>, arg2: <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a>, arg3: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">buildPathVector</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> |  |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">copy</span>(arg1: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>, arg2: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">initializePathValidation</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">interpolate</span>(arg1: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>, arg2: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>, arg3: <span class="hljs-built_in">float</span>, arg4: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">jointBoundConstraint</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>, arg3: <a href="#linearconstraint">LinearConstraint</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">updateParameters</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">updateSplines</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">validatePath</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB1.Splines</a>, arg3: pinocchio.pinocchio_pywrap_default.StdVec_Index, arg4: <span class="hljs-built_in">bool</span>, arg5: <span class="hljs-built_in">bool</span>) -&gt; <a href="#reports">Reports</a></code> |  |

### `SplineOptimizationData`

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">activeParameters</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span><br><br><span class="hljs-meta">@activeParameters.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">activeParameters</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">es</span>(<span class="hljs-params">self</span>) -&gt; <a href="constraints.md#explicitconstraintset">pyhpp.constraints.bindings.ExplicitConstraintSet</a><br><br><span class="hljs-meta">@es.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">es</span>(<span class="hljs-params">self</span>, arg2: <a href="constraints.md#explicitconstraintset">pyhpp.constraints.bindings.ExplicitConstraintSet</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">set</span>(<span class="hljs-params">self</span>) -&gt; <a href="core.md#constraintset">pyhpp.core.bindings.ConstraintSet</a><br><br><span class="hljs-meta">@set.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">set</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#constraintset">pyhpp.core.bindings.ConstraintSet</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

### `SplineOptimizationDatas`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__getitem__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <a href="#splineoptimizationdata">SplineGradientBasedAbstractB1.SplineOptimizationData</a></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <a href="#splineoptimizationdata">SplineGradientBasedAbstractB1.SplineOptimizationData</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__iter__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__len__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__setitem__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <a href="#splineoptimizationdata">SplineGradientBasedAbstractB1.SplineOptimizationData</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">append</span>(<span class="hljs-params">self</span>, arg2: <a href="#splineoptimizationdata">SplineGradientBasedAbstractB1.SplineOptimizationData</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

### `Splines`

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
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">empty</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">extend</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">push_back</span>(<span class="hljs-params">self</span>, arg2: <a href="core-path.md#splineb1">pyhpp.core.path.bindings.SplineB1</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">size</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |

---

## `SplineGradientBasedAbstractB3`

*Inherits: [`pyhpp.core.bindings.PathOptimizer`](core.md#pathoptimizer)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">addContinuityConstraints</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>, arg3: <span class="hljs-built_in">int</span>, arg4: <a href="#splineoptimizationdatas">SplineGradientBasedAbstractB3.SplineOptimizationDatas</a>, arg5: <a href="#linearconstraint">LinearConstraint</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">appendEquivalentSpline</span>(<span class="hljs-params">self</span>, arg2: <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a>, arg3: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">buildPathVector</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>) -&gt; <a href="core-path.md#vector">pyhpp.core.path.bindings.Vector</a></code> |  |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">copy</span>(arg1: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>, arg2: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">initializePathValidation</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">interpolate</span>(arg1: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>, arg2: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>, arg3: <span class="hljs-built_in">float</span>, arg4: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">jointBoundConstraint</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>, arg3: <a href="#linearconstraint">LinearConstraint</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">updateParameters</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">updateSplines</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">validatePath</span>(<span class="hljs-params">self</span>, arg2: <a href="#splines">SplineGradientBasedAbstractB3.Splines</a>, arg3: pinocchio.pinocchio_pywrap_default.StdVec_Index, arg4: <span class="hljs-built_in">bool</span>, arg5: <span class="hljs-built_in">bool</span>) -&gt; <a href="#reports">Reports</a></code> |  |

### `SplineOptimizationData`

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">activeParameters</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span><br><br><span class="hljs-meta">@activeParameters.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">activeParameters</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">es</span>(<span class="hljs-params">self</span>) -&gt; <a href="constraints.md#explicitconstraintset">pyhpp.constraints.bindings.ExplicitConstraintSet</a><br><br><span class="hljs-meta">@es.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">es</span>(<span class="hljs-params">self</span>, arg2: <a href="constraints.md#explicitconstraintset">pyhpp.constraints.bindings.ExplicitConstraintSet</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">set</span>(<span class="hljs-params">self</span>) -&gt; <a href="core.md#constraintset">pyhpp.core.bindings.ConstraintSet</a><br><br><span class="hljs-meta">@set.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">set</span>(<span class="hljs-params">self</span>, arg2: <a href="core.md#constraintset">pyhpp.core.bindings.ConstraintSet</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

### `SplineOptimizationDatas`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__getitem__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <a href="#splineoptimizationdata">SplineGradientBasedAbstractB3.SplineOptimizationData</a></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <a href="#splineoptimizationdata">SplineGradientBasedAbstractB3.SplineOptimizationData</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__iter__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__len__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__setitem__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <a href="#splineoptimizationdata">SplineGradientBasedAbstractB3.SplineOptimizationData</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">append</span>(<span class="hljs-params">self</span>, arg2: <a href="#splineoptimizationdata">SplineGradientBasedAbstractB3.SplineOptimizationData</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

### `Splines`

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
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">empty</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">extend</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">push_back</span>(<span class="hljs-params">self</span>, arg2: <a href="core-path.md#splineb3">pyhpp.core.path.bindings.SplineB3</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">size</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |

---
