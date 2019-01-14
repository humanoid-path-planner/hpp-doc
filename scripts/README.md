## Make a tarball

To avoid conflicts, you must setup a clean environment,
i.e. without having sourced the ROS `setup.bash` or the HPP `config.sh`.
To create the tarball, HPP will be compiled in `$DEVEL_HPP_DIR` (defaults to `/local/devel/hpp`).
You may select the type of build you want using the environment variable `BUILD_TYPE`.

If you sourced `config.sh`, this should be sufficient (although it is unsafe) to create a clean
environment:
```bash
export DEVEL_CONFIG="noconfig"
unset PATH PYTHONPATH ROS_PACKAGE_PATH LD_LIBRARY_PATH CPATH DEVEL_HPP_DIR PKG_CONFIG_PATH CMAKE_PREFIX_PATH HPPCD_PATH
/bin/bash
```

Build the tarball using
```bash
auto-install-hpp.sh --mktar -v
```

You will find three files in the directory `${DEVEL_HPP_DIR}/tarball/`:
* a bash script called `check.***.sh` that should be used in order to resolve the dependencies on a new computer,
* a tarball called `hpp.***.tar.gz` containing only the binaries,
* a tarball called `hpp.src.***.tar.gz` containing the binaries and the source files.

## Build docker images for CI

```
branch=$(git branch --no-color | grep \* | cut -d' ' -f2)
for ubuntu in 14.04 16.04
do
    docker build -t eur0c.laas.fr:5000/humanoid-path-planner/hpp-doc/ubuntu:${ubuntu} -f .dockers/ubuntu-${ubuntu}/Dockerfile ./scripts
    docker build -t eur0c.laas.fr:5000/humanoid-path-planner/hpp-doc/${branch}-premade:${ubuntu} -f .dockers/ubuntu-${ubuntu}/Dockerfile.premade ./scripts
    docker push eur0c.laas.fr:5000/humanoid-path-planner/hpp-doc/ubuntu:${ubuntu}
    docker push eur0c.laas.fr:5000/humanoid-path-planner/hpp-doc/${branch}-premade:${ubuntu}
done
```
