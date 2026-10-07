# How to Contribute

HPP is developed on GitHub in the
[humanoid-path-planner](https://github.com/humanoid-path-planner)
organization. Each package is a separate repository. Development takes place
on branch `devel`.

## Reporting a bug

Open an issue on the repository of the package concerned. Give the HPP version
or commit, the operating system, the installation method, a minimal script
that reproduces the problem and the complete error message.

## Pull requests

Fork the repository, create a branch from `devel` and open the pull request
against `devel`. Before pushing, build the package and run the tests:

```bash
cmake -B build
cmake --build build
cmake --build build -t test
```

A new feature should come with a test or an example.

## Formatting

Formatting is checked by pre-commit hooks, run on each pull request by
pre-commit.ci. To run them locally, install [prek](https://prek.j178.dev/) and
type in the repository:

```bash
prek install
prek run --all-files
```

## Commit messages

Prefix the subject with the modified component in brackets, for instance
`[tutorial_8] Use tutorial_8_launch.py`.

## License

Contributions are distributed under the license of the repository (see file
`LICENSE`).
