## Binary setup with Nix

To open a Nix devShell with all HPP packages already compiled, you can:

  1. Activate HPP-bin Nix environment in the current working directory:

    ```bash
    echo "use flake github:gepetto/nix#hpp-bin" > .envrc
    direnv allow
    ```

    (if you don't want to use nix-direnv, `nix develop github:gepetto/nix#hpp-bin`
    would also work, but you would have to type that in every shell)
