# Humanoid Path Planner Documentation

*A motion planning toolkit for kinematic chains evolving among obstacles — from industrial robot arms to full humanoids.*

## Introduction
HPP is a C++ Software Developement Kit implementing path planning for kinematic chains in environments cluttered with obstacles. Collision checking is performed by a modified version of the Flexible Collision Library developed at University of North Carolina. Robots can be loaded from URDF model. It is a collection of software packages handled by cmake and pkg-config.

## Why HPP?
HPP is not a toy planner: it is built to handle the kind of complex, contact-rich motion planning problems found in real robotics applications.

- **Built for complex kinematic chains** — from single manipulator arms to full humanoids and multi-robot systems.
- **Manipulation planning out of the box** — [hpp-manipulation](/reference/hpp-manipulation/) handles grasping, regrasping, and multi-contact scenarios, not just collision-free transit paths.
- **Fast, reliable collision checking** — powered by a modified Flexible Collision Library (coal) under [hpp-pinocchio](/reference/hpp-pinocchio/).
- **Python-first workflow** — define scenes, robots, and planning problems from simple Python scripts via [hpp-python](/reference/hpp-python/), with the heavy algorithmic lifting handled in C++.
- **Flexible visualization** — watch your robot plan and move in a web browser with [viser](https://viser.studio/main), or plug into your existing ROS/ROS2 setup with [rviz2](https://wiki.ros.org/rviz2) or [gazebo](https://gazebosim.org/home).
- **Battle-tested on real industrial use cases** — surface treatment, welding, and assembly tasks, as shown below.

## Applications
HPP is already used to plan motions for real industrial robotic tasks — here are a few examples in action.

### Surface treatment
Planning a tool path to sweep and abrade the surface of a cylinder, while avoiding self-collisions and obstacles in the workspace.

<iframe title="Sweeping a surface on a cylinder with an abrasion tool" width="560" height="315" src="https://peertube.laas.fr/videos/embed/hSHX1HZ2icsVMgwuw95jYk" style="border: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe>

### Welding
Planning collision-free trajectories for a welding tool around complex parts.

<iframe title="welding" width="560" height="315" src="https://peertube.laas.fr/videos/embed/2vHankanje9jfRRXTGXyXA" style="border: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe>

### Assembly / construction
Planning manipulation sequences to assemble a structure piece by piece, combining grasping, regrasping, and placement.

<iframe width="560" height="315"
title="construction set"
src="https://www.youtube.com/embed/ZVvePCl6qP0"
style="border: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms">
</iframe>

## Overview of the architecture
```mermaid
flowchart TB
    HPPY["hpp-python"]
    subgraph HPP_STACK["HPP stack"]
        direction TB
        HM["hpp-manipulation"]
        HC["hpp-core"]
        HCONS["hpp-constraints"]
        HPIN["hpp-pinocchio"]
        HM --> HC
        HM --> HCONS
        HC --> HPIN
        HCONS --> HPIN
    end
    PIN["pinocchio"]
    COAL["coal"]
    HPIN --> PIN
    HPIN --> COAL
    HPPY --> HPP_STACK
   subgraph HPP_VIZ["HPP Visualization"]
        direction TB
        VW["Viewer"]
        GPV["Gepetto Viewer"]
        GV["Graph Viewer"]
        VW --> GPV
        VW --> GV
   end
   HPPY -->  |import| VW
classDef external fill:#C8E6C9,stroke:#2E7D32;
class PIN,COAL external
```
The software is composed of C++ libraries implementing the algorithms. Python bindings built on Boost.Python are provided to help users easily define and solve problems. Visualization of the scene can be done in a web browser using [viser](https://viser.studio/main), or using ROS/ROS2 with [rviz2](https://wiki.ros.org/rviz2) or [gazebo](https://gazebosim.org/home).

![Rviz Viewer](./figures/viewer_demo.gif)
The algorithmic part, built on [hpp-manipulation](/reference/hpp-manipulation/) is embedded in several Python modules by [hpp-python](/reference/hpp-python/).
From a Python script, users can define scenes containing robots and environments, they can also define and solve motion planning problems.
Results of path planning requests as well as individual configurations can be displayed in a web browser via package [hpp-gepetto-viewer](@hpp-gepetto-viewer_LINK@).

## Getting started
Package [hpp_tutorial](https://github.com/humanoid-path-planner/hpp_tutorial/tree/devel/README.md) provides some examples of how to use this project. Lets start now ! [Tutorial](/reference/hpp-tutorial/)

## Acknowledgement


<img src="./assets/logo_romeo.jpg" alt="Logo projet ROMEO" title="Projet ROMEO 2" height="70">
<img src="./assets/logo_euroc.png" alt="Logo EUROC project" title="EUROC project" height="70">
<img src="./assets/logo-FP7.jpg" alt="Framework Program 7" title="Framework Program 7" height="110">
<img src="./assets/LOGO_ERC.jpg" alt="Logo ERC" title="ERC Actanthrope" height="110">
<img src="./assets/logo_fiad.jpg" alt="EU Project: Factory-in-a-day" title="Factory in a Day" height="110">
<a href="http://www.agence-nationale-recherche.fr"><img src="./assets/logo_anr.gif" alt="Logo ANR project" title="ANR project" height="70"></a>
<img src="./assets/logo_rob4fam.png" alt="Logo ROB4FAM" title="ROB4FAM" height="60">
<img src="./assets/logo_robocom_def_png.png" alt="RoboCom++" title="RoboCom++" height="110">