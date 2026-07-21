# `pyhpp.pinocchio`

## `ComputationFlag`

*Inherits: `int`*

---

## `Device`

> Robot with geometric and dynamic pinocchio.
>
> The creation of the device is done by Device::create(const
>
> std::string name). This function returns a shared pointer to the newly created object. Smart pointers documentation: http://www.boost.org/libs/smart_ptr/smart_ptr.htm

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">computeForwardKinematics</span>(<span class="hljs-params">self</span>, self_: <span class="hljs-built_in">int</span>) -&gt; <span class="hljs-literal">None</span></code> | Compute forward kinematics computing everything. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">computeFramesForwardKinematics</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">configSize</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">configSpace</span>(<span class="hljs-params">self</span>) -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | Returns a LiegroupSpace representing the configuration space. |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">currentConfiguration</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">currentConfiguration</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">bool</span></code> | Get current configuration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">data</span>(<span class="hljs-params">self</span>) -&gt; pinocchio.pinocchio_pywrap_default.Data</code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">geomData</span>(<span class="hljs-params">self</span>) -&gt; pinocchio.pinocchio_pywrap_default.GeometryData</code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">geomModel</span>(<span class="hljs-params">self</span>) -&gt; pinocchio.pinocchio_pywrap_default.GeometryModel</code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getCenterOfMass</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getJointPosition</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-built_in">list</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getJointsPosition</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-built_in">list</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">model</span>(<span class="hljs-params">self</span>) -&gt; pinocchio.pinocchio_pywrap_default.Model</code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> | Get name of device. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">numberDof</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">removeJoints</span>(<span class="hljs-params">self</span>, arg2: pinocchio.pinocchio_pywrap_default.StdVec_StdString, arg3: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">setJointBounds</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">str</span>, arg3: <span class="hljs-built_in">list</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">updateGeometryPlacements</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> | Update the geometry placement to the currentConfiguration. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">visualModel</span>(<span class="hljs-params">self</span>) -&gt; pinocchio.pinocchio_pywrap_default.GeometryModel</code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">rankInConfiguration</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">dict</span></code> |  |

---

## `Gripper`

> Definition of a robot gripper
>
> This class represent a robot gripper as a frame attached to the joint of the robot that holds the gripper.
>
> To graps a box-shaped object with small lengths along x and y, the gripper frame should coincide with the object frame.

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">getParentJointId</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> | Get index of the joint the handle is attached to in pinocchio Model |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">clearance</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">float</span><br><br><span class="hljs-meta">@clearance.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">clearance</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">float</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">localPosition</span>(<span class="hljs-params">self</span>) -&gt; pinocchio.pinocchio_pywrap_default.SE3</code> |  |

---

## `GripperMap`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__contains__</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>) -&gt; <span class="hljs-built_in">bool</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__delitem__</span>(<span class="hljs-params">self</span>, key: <span class="hljs-built_in">str</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__getitem__</span>(<span class="hljs-params">self</span>, key: <span class="hljs-built_in">str</span>) -&gt; <a href="#gripper">Gripper</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__iter__</span>(<span class="hljs-params">self</span>) -&gt; typing.Iterator[str]</code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__len__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">int</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__setitem__</span>(<span class="hljs-params">self</span>, key: <span class="hljs-built_in">str</span>, value: <a href="#gripper">Gripper</a>) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `LiegroupElement`

> hpp::pinocchio::LiegroupElement

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__add__</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <a href="#liegroupspace">LiegroupSpace</a>) -&gt; <span class="hljs-literal">None</span><br><br><span class="hljs-meta">@typing.overload</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: <a href="#liegroupspace">LiegroupSpace</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__sub__</span>(<span class="hljs-params">self</span>, arg2: <a href="#liegroupelement">LiegroupElement</a>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">space</span>(<span class="hljs-params">self</span>) -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | list index out of range |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">vector</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | list index out of range |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">v</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@v.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">v</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `LiegroupElementRef`

> hpp::pinocchio::LiegroupElementRef

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__add__</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray, arg3: <a href="#liegroupspace">LiegroupSpace</a>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__sub__</span>(<span class="hljs-params">self</span>, arg2: <a href="#liegroupelementref">LiegroupElementRef</a>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">space</span>(<span class="hljs-params">self</span>) -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | list index out of range |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">vector</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray</code> | list index out of range |
| <code><span class="hljs-meta">@property</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">v</span>(<span class="hljs-params">self</span>) -&gt; numpy.ndarray<br><br><span class="hljs-meta">@v.setter</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">v</span>(<span class="hljs-params">self</span>, arg2: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |

---

## `LiegroupSpace`

> Cartesian product of elementary Lie groups
>
> Some values produced and manipulated by functions belong to Lie groups For instance rotations, rigid-body motions are element of Lie groups.
>
> Elements of Lie groups are usually applied common operations, like
>
> integrating a velocity from a given element during unit time,
>
> computing the constant velocity that moves from one element to another one in unit time.
>
> By analogy with vector spaces that are a particular type of Lie group, the above operations are implemented as operators + and - respectively acting on LiegroupElement instances.
>
> This class represents a Lie group as the cartesian product of elementaty Lie groups. Those elementary Lie groups are gathered in a variant called LiegroupType.
>
> Elements of a Lie group are represented by class LiegroupElement.

| def | Description |
|:---|:---|
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">R1</span>(rotation: <span class="hljs-built_in">bool</span>) -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | **rotation** — whether values of this space represent angles or lengths. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">R2</span>() -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | Return $\mathbf{R}^2$ as a Lie group. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">R2xSO2</span>() -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | Return $\mathbf{R}^2 \times SO(2)$. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">R3</span>() -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | Return $\mathbf{R}^3$ as a Lie group. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">R3xSO3</span>() -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | Return $\mathbf{R}^3 \times SO(3)$. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">Rn</span>(n: <span class="hljs-built_in">int</span>) -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | **n** — dimension of vector space |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">SE2</span>() -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | Return $SE(2)$. |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">SE3</span>() -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | Return $SE(3)$. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__eq__</span>(<span class="hljs-params">self</span>, arg2: <a href="#liegroupspace">LiegroupSpace</a>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__imul__</span>(<span class="hljs-params">self</span>, arg2: <a href="#liegroupspace">LiegroupSpace</a>) -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__mul__</span>(<span class="hljs-params">self</span>, arg2: <a href="#liegroupspace">LiegroupSpace</a>) -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__ne__</span>(<span class="hljs-params">self</span>, arg2: <a href="#liegroupspace">LiegroupSpace</a>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__str__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">dDifference_dq0</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: numpy.ndarray, arg4: numpy.ndarray, arg5: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">dDifference_dq1</span>(<span class="hljs-params">self</span>, arg2: <span class="hljs-built_in">object</span>, arg3: numpy.ndarray, arg4: numpy.ndarray, arg5: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">dIntegrate_dq</span>(arg1: <span class="hljs-built_in">object</span>, arg2: <span class="hljs-built_in">object</span>, arg3: numpy.ndarray, arg4: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">dIntegrate_dv</span>(arg1: <span class="hljs-built_in">object</span>, arg2: <span class="hljs-built_in">object</span>, arg3: numpy.ndarray, arg4: numpy.ndarray) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-meta">@staticmethod</span><br><span class="hljs-keyword">def</span> <span class="hljs-title function_">empty</span>() -&gt; <a href="#liegroupspace">LiegroupSpace</a></code> | Return empty Lie group. |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">mergeVectorSpaces</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">name</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> | Return name of Lie group. |

---

## `map_indexing_suite_GripperMap_entry`

| def | Description |
|:---|:---|
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__init__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-literal">None</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">__repr__</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">object</span></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">data</span>(<span class="hljs-params">self</span>) -&gt; <a href="#gripper">Gripper</a></code> |  |
| <code><span class="hljs-keyword">def</span> <span class="hljs-title function_">key</span>(<span class="hljs-params">self</span>) -&gt; <span class="hljs-built_in">str</span></code> |  |

---
