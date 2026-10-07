# hpp-manipulation


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
