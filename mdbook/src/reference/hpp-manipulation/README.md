# hpp-manipulation

[![Building Status](https://travis-ci.org/humanoid-path-planner/hpp-manipulation.svg?branch=master)](https://travis-ci.org/humanoid-path-planner/hpp-manipulation)
[![Pipeline status](https://gitlab.laas.fr/humanoid-path-planner/hpp-manipulation/badges/master/pipeline.svg)](https://gitlab.laas.fr/humanoid-path-planner/hpp-manipulation/commits/master)
[![Coverage report](https://gitlab.laas.fr/humanoid-path-planner/hpp-manipulation/badges/master/coverage.svg?job=doc-coverage)](https://gepettoweb.laas.fr/doc/humanoid-path-planner/hpp-manipulation/master/coverage/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/humanoid-path-planner/hpp-manipulation/master.svg)](https://results.pre-commit.ci/latest/github/humanoid-path-planner/hpp-manipulation)

This package is part of the [HPP] software and extends the functionalities of hpp-core.
It implements a solver for manipulation planning problems.

### Dependencies

[hpp-manipulation] needs the following package to be installed:

* [hpp-core]
* [hpp-model]
* [hpp-constraints]
* [hpp-statistics]

### Installation

Make sure you have installed all the dependency.

```sh
$ git clone https://github.com/humanoid-path-planner/hpp-manipulation
$ cd hpp-manipulation
$ mkdir build && cd build
$ cmake ..
$ make install
```

### Todo's

* Online modification of the transition probabilities.
* Solver based on Probabilistic RoadMap.

[hpp-core]:https://github.com/humanoid-path-planner/hpp-core
[HPP]:https://github.com/humanoid-path-planner/hpp-doc
[hpp-constraints]:https://github.com/humanoid-path-planner/hpp-constraints
[hpp-statistics]:https://github.com/billx09/hpp-statistics
[hpp-model]:https://github.com/humanoid-path-planner/hpp-model
[hpp-util]:https://github.com/humanoid-path-planner/hpp-util
