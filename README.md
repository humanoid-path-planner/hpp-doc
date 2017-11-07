#  Humanoid Path Planner

Copyright 2014 LAAS-CNRS

Authors: Florent Lamiraux, Joseph Mirabel

##Description
Humanoid Path Planner is a software platform aimed at solving motion planning
problems for humanoid robots. It is also designed to solve classical (non
humanoid) path planning problems.
This package contains the documentation of HPP.

For more information about the software, please
visit the [HPP website](https://humanoid-path-planner.github.io/hpp-doc).

For installation instructions, visit
the [HPP website](https://humanoid-path-planner.github.io/hpp-doc/download.html?branch=devel)
or [these instructions](doc/instructions.md).

## Build docker images for CI

```
docker build -t eur0c.laas.fr:4567/humanoid-path-planner/hpp-doc/master:14.04 .
docker build -t eur0c.laas.fr:4567/humanoid-path-planner/hpp-doc/master-premade:14.04 -f Dockerfile.premade .
docker push eur0c.laas.fr:4567/humanoid-path-planner/hpp-doc/master:14.04
docker push eur0c.laas.fr:4567/humanoid-path-planner/hpp-doc/master-premade:14.04
```
