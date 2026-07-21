# Installing the software

This tutorial provides a quick procedure to install the software in docker. For general installation instructions, please visit the [project page](https://humanoid-path-planner.github.io/hpp-doc/download.html)

## Prerequisite

  You need a machine running linux with docker installed. See https://docs.docker.com/engine/install/ubuntu for docker installation instructions.

## Installing HPP in a docker image

We will build a minimal docker image containing HPP software from binary packages. Then we will run the image in a container that shares a directory with the host machine. Docker will create a user in the container. In order to avoid file ownership conflicts between this user and your account on your machine, we will make them use the same user id and group.

  1. Create an empty directory on your machine that will be shared by the container and `cd` into this directory.
  2. Download the Dockerfile to build the docker image.

```
wget https://raw.githubusercontent.com/humanoid-path-planner/hpp_tutorial/refs/heads/devel/tutorial_1/Dockerfile
```

  3. Download a lightweight web browser

```
wget https://github.com/goastian/midori-desktop/releases/download/v11.6/midori_11.6-1_amd64.deb
```

  4. Build the docker image

```
docker build --build-arg DOCKER_USER=`id -u` --build-arg DOCKER_GROUP=`id -g` -t hpp:tuto -f Dockerfile .
```

  5. Create directory `src`

```
mkdir src
```

  6. get configuration file and compilation file

```
wget https://raw.githubusercontent.com/humanoid-path-planner/hpp_tutorial/refs/heads/devel/tutorial_1/config.sh
wget -O src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp_tutorial/refs/heads/devel/tutorial_1/Makefile
```

  7. Get script that will run docker

```
wget https://raw.githubusercontent.com/humanoid-path-planner/hpp_tutorial/refs/heads/devel/tutorial_1/run_docker.sh
```

  8. Run the container

```
chmod 775 run_docker.sh
./run_docker.sh
```

  9. In the docker container, install a few things.

```
cd /home/user/devel/src
make all
```

Everything is now installed. You can now exit the container by typing CTRL-D and proceed to [tutorial 2](../tutorial_2/).

### Note

The docker container shares the current directory in your host machine with `/home/user/devel`. As a consequence, if you restart it later, you do not need to redo the previous steps.
