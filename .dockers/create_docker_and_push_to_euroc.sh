docker build -t eur0c.laas.fr:4567/humanoid-path-planner/hpp-doc/ubuntu:16.04 -f .dockers/ubuntu-16.04/Dockerfile .
docker build -t eur0c.laas.fr:4567/humanoid-path-planner/hpp-doc/devel-premade:16.04 -f .dockers/ubuntu-16.04/Dockerfile.premade .
docker login eur0c.laas.fr:4567
docker push eur0c.laas.fr:4567/humanoid-path-planner/hpp-doc/devel-premade:16.04
