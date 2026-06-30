# Humanoid Path Planner Documentation

## Introduction

HPP (Humanoid Path Planner) is a collection of software packages implementing manipulation planning functionalities for diverse types of robots, including humanoid robots.


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

The software is composed of C++ libraries implementing the algorithms. Python bindings built on Boost.Python are provided to help users easily define and solve problems. Visualization of the scene can be done in a web browser using [viser](https://viser.studio/main), or using ROS/ROS2 with [rviz2](https://wiki.ros.org/rviz2) or [gazebo](https://gazebosim.org/home) .

![Rviz Viewer](./figures/viewer_demo.gif)

The algorithmic part, built on [hpp-manipulation](/reference/hpp-manipulation/) is embedded in several Python modules by [hpp-python](/reference/hpp-python/).

From a Python script, users can define scenes containing robots and environments, they can also define and solve motion planning problems.


Results of path planning requests as well as individual configurations can be displayed in a web browser via package [hpp-gepetto-viewer](@hpp-gepetto-viewer_LINK@).


## Getting started

Package [hpp_tutorial](https://github.com/humanoid-path-planner/hpp_tutorial/tree/devel/README.md) provides some examples of how to use this project. Lets start now ! [Tutorial](/reference/hpp-tutorial/)

