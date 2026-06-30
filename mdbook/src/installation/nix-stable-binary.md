# Binary setup with Nix

To open a Nix development environment with all HPP packages already compiled, follow these steps.

## 1. Setup direnv (optional but recommended)

Install and configure [direnv](https://direnv.net/) with [nix-direnv](https://github.com/nix-community/nix-direnv/).

This step is already done on LAAS computers.

## 2. Setup the Gepetto Nix binary cache (optional but recommended)

Configure the Gepetto Nix binary cache:

[Gepetto binary cache](https://app.cachix.org/cache/gepetto)

This step is already done on LAAS computers.

## 3. Activate the HPP binary Nix environment

In the current working directory, create the environment configuration:

```bash
echo "use flake github:gepetto/nix#hpp-bin" > .envrc
direnv allow
```

If you do not want to use `nix-direnv`, you can alternatively run:

```bash
nix develop github:gepetto/nix#hpp-bin
```

However, this command must be executed manually in each new shell.
