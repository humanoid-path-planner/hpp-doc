# `pyhpp.pinocchio`

## `Device`

> Robot with geometric and dynamic pinocchio.
>
> The creation of the device is done by Device::create(const
>
> std::string name). This function returns a shared pointer to the newly created object. Smart pointers documentation: http://www.boost.org/libs/smart_ptr/smart_ptr.htm

| Method | Description |
|:---|:---|
| `computeForwardKinematics` | Compute forward kinematics computing everything. |
| `configSpace` | Returns a LiegroupSpace representing the configuration space. |
| `currentConfiguration` | Get current configuration. |
| `name` | Get name of device. |
| `updateGeometryPlacements` | Update the geometry placement to the currentConfiguration. |

---

## `Gripper`

*Not instantiable from Python.*

> Definition of a robot gripper
>
> This class represent a robot gripper as a frame attached to the joint of the robot that holds the gripper.
>
> To graps a box-shaped object with small lengths along x and y, the gripper frame should coincide with the object frame.

| Method | Description |
|:---|:---|
| `getParentJointId` | Get index of the joint the handle is attached to in pinocchio Model |

---

## `LiegroupElement`

> hpp::pinocchio::LiegroupElement

| Method | Description |
|:---|:---|
| `space` | list index out of range |
| `vector` | list index out of range |

---

## `LiegroupElementRef`

> hpp::pinocchio::LiegroupElementRef

| Method | Description |
|:---|:---|
| `space` | list index out of range |
| `vector` | list index out of range |

---

## `LiegroupSpace`

*Not instantiable from Python.*

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

| Method | Description |
|:---|:---|
| `R1` | **rotation** — whether values of this space represent angles or lengths. |
| `R2` | Return $\mathbf{R}^2$ as a Lie group. |
| `R2xSO2` | Return $\mathbf{R}^2 \times SO(2)$. |
| `R3` | Return $\mathbf{R}^3$ as a Lie group. |
| `R3xSO3` | Return $\mathbf{R}^3 \times SO(3)$. |
| `Rn` | **n** — dimension of vector space |
| `SE2` | Return $SE(2)$. |
| `SE3` | Return $SE(3)$. |
| `empty` | Return empty Lie group. |
| `name` | Return name of Lie group. |

---
