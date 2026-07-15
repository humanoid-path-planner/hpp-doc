# `pyhpp.core.path`

## `SplineB1`

*Inherits: [`pyhpp.core.bindings.Path`](core.md#path)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">basisFunctionDerivative</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <span class="hljs-built_in">float</span>, arg4: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameterDerivativeCoefficients</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameterDerivativeCoefficients</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameterIntegrate</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameterSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">rowParameters</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">squaredNormBasisFunctionIntegral</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">squaredNormIntegral</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">float</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">squaredNormIntegralDerivative</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `SplineB3`

*Inherits: [`pyhpp.core.bindings.Path`](core.md#path)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">basisFunctionDerivative</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <span class="hljs-built_in">float</span>, arg4: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameterDerivativeCoefficients</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameterDerivativeCoefficients</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameterIntegrate</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">parameterSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">rowParameters</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">squaredNormBasisFunctionIntegral</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">squaredNormIntegral</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">float</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">squaredNormIntegralDerivative</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `Vector`

*Inherits: [`pyhpp.core.bindings.Path`](core.md#path)*

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">int</span>, arg3: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-built_in">object</span></code> | Create an empty path vector. param: inputSize dimension of the configuration space, inputDerivativeSize dimension of the tangent space. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">appendPath</span>(<span class="hljs-params">self</span>, path: <a href="core.md#path">pyhpp.core.bindings.Path</a>) -&gt; <span class="hljs-literal">None</span></code> | Append a path at the end of the vector. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">concatenate</span>(<span class="hljs-params">self</span>, path: <a href="#vector">Vector</a>) -&gt; <span class="hljs-literal">None</span></code> | :param :path to append at the end of this one |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">flatten</span>(<span class="hljs-params">self</span>, flattenedPath: <a href="#vector">Vector</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">numberPaths</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Get the number of sub paths. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">pathAtRank</span>(<span class="hljs-params">self</span>, rank: <span class="hljs-built_in">int</span>) -&gt; <a href="core.md#path">pyhpp.core.bindings.Path</a></code> | **rank** — rank of the path in the vector. Should be between 0 and numberPaths (). |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">rankAtParam</span>(<span class="hljs-params">self</span>, param: <span class="hljs-built_in">float</span>, localParam: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-built_in">int</span></code> | **param** — parameter in interval of definition, **localParam** — parameter on sub-path |

---

## `Vectors`

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
