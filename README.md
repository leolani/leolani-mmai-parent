# leolani-mmai-parent

Parent repository for the Leolani App. This repository uses Python 3.9.

This repository contains all components of the Leolani app as _git_ submodules and can be used as the
root to execute [build commands](https://github.com/leolani/cltl-build/tree/main/make) that are run on the components.

For a description of the Leolani App see to the [README](https://github.com/leolani/cltl-leolani-app) there.

## Check-out

To check out all code needed for the Leolani App, clone this repository including all submodules:

        git clone --recurse-submodules -j8 https://github.com/leolani/leolani-mmai-parent.git

Checkout the current state of the parent

        git checkout --recurse-submodules

Update to the current branch heads of the submodules:

        git submodule update --remote

## Run the application

Checkout the repository as described in [Check-out](#check-out). Then go to the
repository root, build the project, activate the virtual environment for the
Python application and run it. Altogether:

        git clone --recurse-submodules -j8 https://github.com/leolani/leolani-mmai-parent.git
        cd leolani-mmai-parent
        make build
        cd cltl-leolani-app
        source venv/bin/active
        cd py-app
        python app.py

*Remember to launch GraphDB and have a repository called 'sandbox'*

[comment]: <> (To remove)
Also make a folder as such

```
cd cltl-leolani-app/py-app
mkdir data
cd data
mkdir scenarios
```

## Development

Follow the instructions in [cltl-combot](https://github.com/leolani/cltl-combot).
