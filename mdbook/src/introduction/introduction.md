# Humanoid Path Planner Documentation

*A motion planning toolkit for kinematic chains evolving among obstacles — from industrial robot arms to full humanoids.*

## Introduction
HPP is a C++ Software Developement Kit implementing path planning for kinematic chains in environments cluttered with obstacles. Collision checking is performed by a modified version of the Flexible Collision Library developed at University of North Carolina. Robots can be loaded from URDF model. It is a collection of software packages handled by cmake and pkg-config.

## Why HPP?
HPP is not a toy planner: it is built to handle the kind of complex, contact-rich motion planning problems found in real robotics applications.

- **Built for complex kinematic chains** — from single manipulator arms to full humanoids and multi-robot systems.
- **Manipulation planning out of the box** — [hpp-manipulation](/hpp-doc/reference/hpp-manipulation/) handles grasping, regrasping, and multi-contact scenarios, not just collision-free transit paths.
- **Fast, reliable collision checking** — powered by a modified Flexible Collision Library (coal) under [hpp-pinocchio](/hpp-doc/reference/hpp-pinocchio/).
- **Python-first workflow** — define scenes, robots, and planning problems from simple Python scripts via [hpp-python](/hpp-doc/reference/hpp-python/), with the heavy algorithmic lifting handled in C++.
- **Flexible visualization** — watch your robot plan and move in a web browser with [viser](https://viser.studio/main), or plug into your existing ROS/ROS2 setup with [rviz2](https://wiki.ros.org/rviz2) or [gazebo](https://gazebosim.org/home).
- **Battle-tested on real industrial use cases** — surface treatment, welding, and assembly tasks, as shown below.

## Applications
HPP is already used to plan motions for real industrial robotic tasks — here are a few examples in action.

### Surface treatment
Planning a tool path to sweep and abrade the surface of a cylinder, while avoiding self-collisions and obstacles in the workspace.
<p align="center">

<iframe title="Sweeping a surface on a cylinder with an abrasion tool" width="560" height="315" src="https://peertube.laas.fr/videos/embed/hSHX1HZ2icsVMgwuw95jYk" style="border: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe>
</p>

### Welding
Planning collision-free trajectories for a welding tool around complex parts.

<p align="center">
<iframe title="welding" width="560" height="315" src="https://peertube.laas.fr/videos/embed/2vHankanje9jfRRXTGXyXA" style="border: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe>
</p>

### Assembly / construction
Planning manipulation sequences to assemble a structure piece by piece, combining grasping, regrasping, and placement.

<p align="center">
<iframe width="560" height="315"
title="construction set"
src="https://www.youtube.com/embed/ZVvePCl6qP0"
style="border: 0px;" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms">
</iframe>
</p>

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

![Rviz Viewer](/hpp-doc/introduction/figures/viewer_demo.gif)
The algorithmic part, built on [hpp-manipulation](/hpp-doc/reference/hpp-manipulation/) is embedded in several Python modules by [hpp-python](/hpp-doc/reference/hpp-python/).
From a Python script, users can define scenes containing robots and environments, they can also define and solve motion planning problems.
Results of path planning requests as well as individual configurations can be displayed in a web browser via package [hpp-gepetto-viewer](@hpp-gepetto-viewer_LINK@).

## Getting started
Package [hpp_tutorial](https://github.com/humanoid-path-planner/hpp_tutorial/tree/devel/README.md) provides some examples of how to use this project. Lets start now ! [Tutorial](/hpp-doc/reference/hpp-tutorial/)

## Acknowledgement


<img src="/hpp-doc/introduction/assets/logo_romeo.jpg" alt="Logo projet ROMEO" title="Projet ROMEO 2" height="70">
<img src="/hpp-doc/introduction/assets/logo_euroc.png" alt="Logo EUROC project" title="EUROC project" height="70">
<img src="/hpp-doc/introduction/assets/logo-FP7.jpg" alt="Framework Program 7" title="Framework Program 7" height="110">
<img src="/hpp-doc/introduction/assets/LOGO_ERC.jpg" alt="Logo ERC" title="ERC Actanthrope" height="110">
<img src="/hpp-doc/introduction/assets/logo_fiad.jpg" alt="EU Project: Factory-in-a-day" title="Factory in a Day" height="110">
<a href="http://www.agence-nationale-recherche.fr"><img src="/hpp-doc/introduction/assets/logo_anr.gif" alt="Logo ANR project" title="ANR project" height="70"></a>
<img src="/hpp-doc/introduction/assets/logo_rob4fam.png" alt="Logo ROB4FAM" title="ROB4FAM" height="60">
<img src="/hpp-doc/introduction/assets/logo_robocom_def_png.png" alt="RoboCom++" title="RoboCom++" height="110">

## Contributors

Thanks to all the contributors of the HPP project:


<p align="center">
<a href="https://github.com/jmirabel">
  <img src="https://github.com/jmirabel.png" width="80" title="jmirabel (5424 contributions)"/>
</a>
<a href="https://github.com/nim65s">
  <img src="https://github.com/nim65s.png" width="80" title="nim65s (4650 contributions)"/>
</a>
<a href="https://github.com/florent-lamiraux">
  <img src="https://github.com/florent-lamiraux.png" width="80" title="florent-lamiraux (3621 contributions)"/>
</a>
<a href="https://github.com/pFernbach">
  <img src="https://github.com/pFernbach.png" width="80" title="pFernbach (1932 contributions)"/>
</a>
<a href="https://github.com/psardin001">
  <img src="https://github.com/psardin001.png" width="80" title="psardin001 (345 contributions)"/>
</a>
<a href="https://github.com/laastp">
  <img src="https://github.com/laastp.png" width="80" title="laastp (140 contributions)"/>
</a>
<a href="https://github.com/stonneau">
  <img src="https://github.com/stonneau.png" width="80" title="stonneau (127 contributions)"/>
</a>
<a href="https://github.com/hrp2-14">
  <img src="https://github.com/hrp2-14.png" width="80" title="hrp2-14 (116 contributions)"/>
</a>
<a href="https://github.com/thomas-moulard">
  <img src="https://github.com/thomas-moulard.png" width="80" title="thomas-moulard (90 contributions)"/>
</a>
<a href="https://github.com/Toefinder">
  <img src="https://github.com/Toefinder.png" width="80" title="Toefinder (89 contributions)"/>
</a>
<a href="https://github.com/DiegoP-G">
  <img src="https://github.com/DiegoP-G.png" width="80" title="DiegoP-G (59 contributions)"/>
</a>
<a href="https://github.com/wxmerkt">
  <img src="https://github.com/wxmerkt.png" width="80" title="wxmerkt (54 contributions)"/>
</a>
<a href="https://github.com/nmansard">
  <img src="https://github.com/nmansard.png" width="80" title="nmansard (38 contributions)"/>
</a>
<a href="https://github.com/andreadelprete">
  <img src="https://github.com/andreadelprete.png" width="80" title="andreadelprete (33 contributions)"/>
</a>
<a href="https://github.com/DianeBury">
  <img src="https://github.com/DianeBury.png" width="80" title="DianeBury (32 contributions)"/>
</a>
<a href="https://github.com/ymontmarin">
  <img src="https://github.com/ymontmarin.png" width="80" title="ymontmarin (26 contributions)"/>
</a>
<a href="https://github.com/jcarpent">
  <img src="https://github.com/jcarpent.png" width="80" title="jcarpent (22 contributions)"/>
</a>
<a href="https://github.com/Kotochleb">
  <img src="https://github.com/Kotochleb.png" width="80" title="Kotochleb (20 contributions)"/>
</a>
<a href="https://github.com/loanBRNT">
  <img src="https://github.com/loanBRNT.png" width="80" title="loanBRNT (9 contributions)"/>
</a>
<a href="https://github.com/sebastiendalibard">
  <img src="https://github.com/sebastiendalibard.png" width="80" title="sebastiendalibard (6 contributions)"/>
</a>
<a href="https://github.com/JasonChmn">
  <img src="https://github.com/JasonChmn.png" width="80" title="JasonChmn (6 contributions)"/>
</a>
<a href="https://github.com/aorthey">
  <img src="https://github.com/aorthey.png" width="80" title="aorthey (6 contributions)"/>
</a>
<a href="https://github.com/RenaudViry">
  <img src="https://github.com/RenaudViry.png" width="80" title="RenaudViry (5 contributions)"/>
</a>
<a href="https://github.com/MaximilienNaveau">
  <img src="https://github.com/MaximilienNaveau.png" width="80" title="MaximilienNaveau (5 contributions)"/>
</a>
<a href="https://github.com/ksyy">
  <img src="https://github.com/ksyy.png" width="80" title="ksyy (5 contributions)"/>
</a>
<a href="https://github.com/alexandrethiault">
  <img src="https://github.com/alexandrethiault.png" width="80" title="alexandrethiault (5 contributions)"/>
</a>
<a href="https://github.com/timtmit">
  <img src="https://github.com/timtmit.png" width="80" title="timtmit (4 contributions)"/>
</a>
<a href="https://github.com/rlefevre1">
  <img src="https://github.com/rlefevre1.png" width="80" title="rlefevre1 (3 contributions)"/>
</a>
<a href="https://github.com/IliasHar">
  <img src="https://github.com/IliasHar.png" width="80" title="IliasHar (3 contributions)"/>
</a>
<a href="https://github.com/teguhSL">
  <img src="https://github.com/teguhSL.png" width="80" title="teguhSL (2 contributions)"/>
</a>
<a href="https://github.com/olivier-stasse">
  <img src="https://github.com/olivier-stasse.png" width="80" title="olivier-stasse (2 contributions)"/>
</a>
<a href="https://github.com/thanhndv212">
  <img src="https://github.com/thanhndv212.png" width="80" title="thanhndv212 (1 contributions)"/>
</a>
<a href="https://github.com/petrikvladimir">
  <img src="https://github.com/petrikvladimir.png" width="80" title="petrikvladimir (1 contributions)"/>
</a>
<a href="https://github.com/fvalenza">
  <img src="https://github.com/fvalenza.png" width="80" title="fvalenza (1 contributions)"/>
</a>
<a href="https://github.com/daeunSong">
  <img src="https://github.com/daeunSong.png" width="80" title="daeunSong (1 contributions)"/>
</a>
<a href="https://github.com/airobert">
  <img src="https://github.com/airobert.png" width="80" title="airobert (1 contributions)"/>
</a>
<a href="https://github.com/0">
  <img src="https://github.com/0.png" width="80" title="0 ( contributions)"/>
</a>
</p>
