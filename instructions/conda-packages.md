## Source installation on every Linux or Osx

### Installation
To install all the packages on any Linux or Osx distribution

  1. Install miniconda through [the miniconda installation website.](https://docs.conda.io/en/latest/miniconda.html).

  2. Create an environment with your choice of python version (from `3.8` to `3.11`).

```bash
conda create -n hpp -c conda-forge python=3.11 hpp-doc -y
```

It will install all hpp packages and gepetto viewer with python bindings.

### Usage
Remember to use `conda activate hpp` in every terminal where you run `hppcorbaserver`, `hpp-manipulation-server`, `gepetto-gui` or any Python script that uses hpp.

To access the documentation, open a terminal activate the environment, and open the file `$CONDA_PREFIX/share/doc/hpp-doc/index.html` with the browser of your choice:

```bash
conda activate hpp
firefox $CONDA_PREFIX/share/doc/hpp-doc/index.html
```
