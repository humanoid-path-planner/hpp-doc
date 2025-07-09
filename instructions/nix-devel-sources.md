## Source installation with Nix

To compile all the packages in a Nix devShell, you should do the following steps:

  1. Choose a directory on your file system which we will call
     `DEVEL_HPP_DIR`.
     - the packages will be cloned into `$DEVEL_HPP_DIR/src`,
     - the packages will be installed in `$DEVEL_HPP_DIR/install`.

     Create that directory and enter inside

  2. Activate HPP Nix environment:

    ```bash
    echo "use flake github:gepetto/nix#hpp" > .envrc
    direnv allow
    ```

    (if you don't want to use nix-direnv, `nix develop github:gepetto/nix#hpp`
    would also work, but you would have to type that in every shell)

    This will define `$DEVEL_HPP_DIR` environment variable to the current working directory.

  3. Get the Makefile

    ```bash
    wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/devel/makefiles/devel.mk
    ```

  4. cd into `$DEVEL_HPP_DIR/src` and type

    ```bash
    cd $DEVEL_HPP_DIR/src
    make all
    ```
