## Source installation on every Linux or Osx

To install all the packages on any Linux or Osx distribution

  1. Install miniconda [the miniconda installation website.](https://docs.conda.io/en/latest/miniconda.html).

  2. Create an environment with your choice of python version (from `3.8` to `3.11`).

    ```bash
    conda create -n hpp -c conda-forge python=3.8 hpp-doc -y
    ```

It will install all hpp packages and gepetto viewer with python bindings.

Remember to use `conda activate hpp` in every terminal where you run `hppcorbaserver`, `hpp-manipulation-server`, `gepetto-gui` or any Python script that uses hpp.

To access the documentation, open:  `firefox $CONDA_PREFIX/share/doc/hpp-doc/index.html` in a web browser and you will have access to the documentation of most packages.
