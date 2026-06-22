FROM ros:jazzy

WORKDIR /ws
RUN mkdir src

ADD devel.repos .
RUN vcs import --input devel.repos src

RUN --mount=type=cache,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,sharing=locked,target=/var/lib/apt \
    apt update \
 && rosdep install --from-paths src --ignore-src -r -y

RUN . /opt/ros/jazzy/setup.sh \
 && colcon build
