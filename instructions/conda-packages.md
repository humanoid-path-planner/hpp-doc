## Source installation on every linux or osx

To install all the packages on any linux or osx distribution

  1. Install miniconda [the miniconda installation website.](https://docs.conda.io/en/latest/miniconda.html).

  2. Create an environment with your choice of python version (from `3.8` to `3.11`).

    ```bash
    conda create -n hpp -c conda-forge python=3.8 hpp-gepetto-viewer -y
    ```

It will install all hpp packages and gepetto viewer with python bindings.

Remember to use `conda activate hpp` in every terminal where you run `hppcorbaserver`, `hpp-manipulation-server`, `gepetto-gui` or any python script that use hpp.
