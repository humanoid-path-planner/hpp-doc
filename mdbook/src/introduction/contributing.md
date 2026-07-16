# How to Contribute

Thanks for your interest in contributing to this project! Here are a few simple guidelines to follow.

## Reporting a bug

- Check that a similar issue doesn't already exist in the *Issues* section.
- Open a new issue describing:
  - the expected behavior and the observed behavior,
  - steps to reproduce the problem,
  - your environment (OS, package version, compiler, Python version...).

## Proposing a change (Pull Request)

1. Fork the repository, then clone your fork.
2. Create a dedicated branch from `devel` (or `master`, depending on the repo):
   ```bash
   git checkout -b my-feature
   ```
3. Make your changes, keeping commits clear and atomic.
4. Follow the existing code style of the file you're modifying (C++ or Python).
5. If you add a feature, add or update the corresponding tests.
6. Make sure the project builds and the tests pass:
   ```bash
   mkdir build && cd build
   cmake ..
   make
   make test
   ```
7. Push your branch and open a Pull Request against the upstream repository.
8. Clearly describe what your PR does and why.

## Pre-commit

This project uses [pre-commit](https://pre-commit.com/) to automatically check code formatting and quality before each commit.

1. Install pre-commit (one-time setup):
   ```bash
   pip install pre-commit
   ```
2. Enable the hooks in your local clone:
   ```bash
   pre-commit install
   ```
3. From then on, checks run automatically on every `git commit`.
   You can also run them manually on all files:
   ```bash
   prek run --all-files
   ```
4. If a hook modifies files (auto-formatting), stage those changes and commit again:
   ```bash
   git add -u
   git commit
   ```

The repository also uses `pre-commit.ci`, so the hooks will automatically be checked on your Pull Request as well.

## Commit messages

- Use short, descriptive, imperative-mood messages (e.g. `Fix collision check in hpp-core`).
- One change = one commit whenever possible.

## License

By contributing, you agree that your code will be distributed under the project's license (see the `LICENSE` file of the relevant repository).

## Questions

For any questions, open an issue or check the documentation at https://humanoid-path-planner.github.io/hpp-doc/