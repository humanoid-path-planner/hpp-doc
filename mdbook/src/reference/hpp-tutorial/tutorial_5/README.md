# How to optimize and time-parameterize paths.

## Prerequisite

Having completed [tutorial 4](../tutorial_4/)

## Initializing the problem

In the docker container, cd into `tutorial_5` directory. In a bash terminal, run

```
python -i init.py
```

The script contains the code of [tutorial 4](../tutorial_4/) with an additional obstacle
placed between the robot and the plate. This forces the planner to find a non-straight path for `p1`
(the motion from `q_init` to the pregrasp configuration `qpg`).

The path `p1` uses a dimensionless path parameter `s` ranging from `0` to `p1.length()`. This
parameter does not correspond to real time: the robot has no notion of velocity or acceleration
along this path.

## Visualizing the raw path

A small helper in `plot.py` plots joint positions, velocities, and accelerations against the path
parameter. It returns the `matplotlib` figure so you can inspect it interactively or save it:

```python
from plot import plotTraj

fig = plotTraj(p1, 0, 7, order=2)
fig.show()
```

The raw path `p1` is collision-free but typically jagged, with abrupt direction changes. The
acceleration plot shows large spikes — this is what the rest of this tutorial smooths out.

## Path optimization

Before time parameterization we smooth the path with `SplineGradientBased_bezier3`, which fits a
cubic-Bézier spline that minimizes integral squared acceleration while remaining collision-free:

```python
from pyhpp.core import SplineGradientBased_bezier3

bezier = SplineGradientBased_bezier3(problem)
p2 = bezier.optimize(p1)
print(f"Smoothed path length: {p2.length():.3f} (was {p1.length():.3f})")
```

The resulting path is continuously differentiable (C1),  a prerequisite for producing a smooth velocity profile in
the next step.

## Time parameterization

### TOPPRA

TOPPRA (Time-Optimal Path Parameterization based on Reachability Analysis) computes the
time-optimal parameterization subject to velocity, acceleration, and torque constraints. Applied
directly to the raw path `p1`, TOPPRA produces endpoint velocity discontinuities and an
acceleration spike at the start. Applied after `SplineGradientBased_bezier3`, the smoothed
spline eliminates these and keeps accelerations bounded throughout. Note that the acceleration
bounds apply only on selected joints. Below, we select only the robot joints.

```python
import numpy as np
from pyhpp_toppra import Toppra

toppra = Toppra(problem)
toppra.velocityScale = 0.5
toppra.effortScale = -1
toppra.N = 100
toppra.selectJoints([f"staubli/joint_{i}" for i in range(1,7)])
toppra.accelerationLimits = np.array(6 * [0.5])
p3 = toppra.optimize(p2)
print(f"TOPPRA duration: {p3.length():.3f} s")
```

Parameters:
- `velocityScale`: scaling factor for velocity limits (1.0 = full velocity). Use a small value
  (e.g. 0.5) for slower, more visible motions.
- `effortScale`: scaling factor for torque limits. Set to a negative value to disable torque
  constraints. **Note**: torque constraints require mass and inertia data in the robot URDF. The
  Staubli model has no dynamics data, so `effortScale` must be set to `-1` (disabled).
- `accelerationLimits`: per-DOF acceleration cap. The vector size must match the problem's
  **velocity** dimension, not the configuration size — here it is `6` (6-DOF Staubli arm).
- `N`: minimal number of discretization points along the path.
- `interpolationMethod`: `"constant_acceleration"` or `"hermite"`.
- `gridpointMethod`: `"param_space"` or `"time_space"`.

Compare the profiles after Bézier smoothing and after optimal time parameterization:

```python
fig = plotTraj(p2, 0, 7, order=2)
fig.show()
fig = plotTraj(p3, 0, 7, order=2)
fig.show()
```

### SimpleTimeParameterization (simpler alternative)

When `hpp-toppra` is not available, `SimpleTimeParameterization` computes a polynomial time
parameterization that maps real time `t` to the path parameter `s`, while respecting joint
velocity and acceleration limits. It is less optimal than TOPPRA but needs no extra dependency.

```python
from pyhpp.core import SimpleTimeParameterization

stp = SimpleTimeParameterization(problem)
stp.order = 2
stp.safety = 0.95
stp.maxAcceleration = 0.5
p_stp = stp.optimize(p2)
print(f"STP duration: {p_stp.length():.3f} s")
```

Parameters:
- `order`: polynomial continuity order. `0` = linear (C0), `1` = cubic (C1, zero velocity at
  endpoints), `2` = quintic (C2, zero velocity and acceleration at endpoints).
- `safety`: scaling factor for velocity limits (0.95 = use 95% of max velocity).
- `maxAcceleration`: maximum acceleration per DOF in rad/s². Only used when `order >= 2`. Set to
  a negative value to disable.

## Visualization

You can visualize the path in the viewer:
```python
v = display()
v.loadPath(p3)
```
