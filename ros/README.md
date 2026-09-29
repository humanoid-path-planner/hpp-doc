# ROS HPP docker

## Build

```
docker build -t hpp-ros .
docker run --rm -it hpp-ros
```

## Included packages

```
# colcon graph
example_robot_data       +      * ** ******....*
hpp_affordance            +
hpp_centroidal_dynamics    +     *
hpp_plot                    +
hpp_rviz                     +
hpp_tools                     +
hpp_util                       +    * *.*..*....
hpp_baxter                      +
hpp_bezier_com_traj              +
hpp_environments                  +   *.*.......
hpp_romeo                          +
hpp_statistics                      +  **.......
hpp_universal_robot                  +
hpp_pinocchio                         +**..*....
hpp_constraints                        +*..*....
hpp_core                                +*.*....
hpp_manipulation                         +**...*
hpp_manipulation_urdf                     +*....
hpp_python                                 +***.
hpp_exec                                    +
hpp_gepetto_viewer                           + *
hpp_toppra                                    +
hpp_tutorial                                   +
```
