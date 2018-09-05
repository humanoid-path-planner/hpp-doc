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
branch=$(git branch --no-color | grep \* | cut -d' ' -f2)
for ubuntu in 14.04 16.04
do
    docker build -t eur0c.laas.fr:5000/humanoid-path-planner/hpp-doc/ubuntu:${ubuntu} -f .dockers/ubuntu-${ubuntu}/Dockerfile .
    docker build -t eur0c.laas.fr:5000/humanoid-path-planner/hpp-doc/${branch}-premade:${ubuntu} -f .dockers/ubuntu-${ubuntu}/Dockerfile.premade .
    docker push eur0c.laas.fr:5000/humanoid-path-planner/hpp-doc/ubuntu:${ubuntu}
    docker push eur0c.laas.fr:5000/humanoid-path-planner/hpp-doc/${branch}-premade:${ubuntu}
done
```
