# eliza-parent

Parent repository for the Eliza App.

This repository contains all components of the Eliza app as _git_ submodules and can be used as the
root to execute [build commands](https://github.com/leolani/cltl-build/tree/main/make) that are run on the components.

For a description of the Eliza App see to the
[README](https://github.com/leolani/cltl-eliza-app) there.

## Development

### Check-out

To check out all code needed for the Eliza App, clone this repository including all submodules:

        git clone --recurse-submodules -j8 https://github.com/leolani/eliza-parent.git

### Workflow using PyCharm

1. Checkout the repository with submodules (see above).
1. Build the project running `make build` from the parent root. This will create virtual environments for all components
and build and install Python packages for each component.
1. Go to `File > Open` in PyCharm and select the `cltl-eliza-app` as new project in PyCharm. Later, PyCharm will list the workbench with this project name in `Recently Opened`.
1. To add the other components, go to `File > Open` again in PyCharm and select all other compoents. For each component choose `Attach` to add it
to the current workbench. The virtual environments created in step 2 will be used automatically by PyCharm.
1. Code changes in a single module do not require any special workflow, try to add unit tests to make sure the code works.
1. To make code changes visible across modules, `make build` **must** be run from the parent project to rebuild packages and update the individual
virtual environments of the components with the updated packages.
1. Commit and push the code changes in the individual modules as usual.
1. Create an application that configures and runs the components (see https://github.com/leolani/cltl-eliza-app for an example).
1. Commit the state of the submodules in the parent when the components of the application are in a consistent state.

#### Things to pay attention to

1. In the above workflow each component has its own virtual environment in the `venv/` folder, and this is respected by PyCharm. For this reason,
    - code becomes visible to other components only after running `make build`.
    - navigation in PyCharm will lead to the **module in the virtual environment,
     not to the original source**. Therefore, if you make changes there, they will
     be overriden during the next build. You will also get a warning from PyCharm
     if you try to edit those files.
    - for debugging breakpoints need to be set in the virtual environemnt. To achieve that navigate there from the module that is run in PyCharm (app
    component)
