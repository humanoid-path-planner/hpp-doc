# Source installation with Nix

To compile all HPP packages inside a Nix development environment, follow these steps.

## 1. Setup direnv (optional but recommended)

Install and configure [direnv](https://direnv.net/) with [nix-direnv](https://github.com/nix-community/nix-direnv/).

This step is already done on LAAS computers.

## 2. Setup the Gepetto Nix binary cache (optional but recommended)

Configure the Gepetto Nix binary cache:

[Gepetto binary cache](https://app.cachix.org/cache/gepetto)

This step is already done on LAAS computers.

## 3. Choose a development directory

Choose a directory on your filesystem. This directory will be referred to as <code class="env-variable">DEVEL_HPP_DIR</code>.

* The packages will be cloned into <code class="env-variable">$DEVEL_HPP_DIR/src</code>.
* The packages will be installed into <code class="env-variable">$DEVEL_HPP_DIR/install</code>.

Create the directory and enter it:

```bash id="j8x4as"
mkdir -p $DEVEL_HPP_DIR
cd $DEVEL_HPP_DIR
```

## 4. Activate the HPP Nix environment

Create the `.envrc` file:

```bash id="4jzq3n"
echo "use flake github:gepetto/nix#hpp" > .envrc
direnv allow
```

If you do not want to use `nix-direnv`, you can alternatively run:

```bash id="0t1c7d"
nix develop github:gepetto/nix#hpp
```

However, this command must be executed manually in each new shell.

The Nix environment will define the <code class="env-variable">DEVEL_HPP_DIR</code> environment variable to the current working directory.

## 5. Get the Makefile

Download the Makefile:

```bash id="j9z5bp"
wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/devel/makefiles/devel.mk
```

## 6. Compile all packages

Build all HPP packages:

```bash id="x7s3we"
cd $DEVEL_HPP_DIR/src
make all
```
