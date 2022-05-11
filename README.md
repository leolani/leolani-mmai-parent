# leolani-mmai-parent

Parent repository for the Leolani App. This repository uses Python 3.9.

This repository contains all components of the Leolani app as _git_ submodules and can be used as the root to
execute [build commands](https://github.com/leolani/cltl-build/tree/main/make) that are run on the components.

For a description of the Leolani App see to the [README](https://github.com/leolani/cltl-leolani-app) there.

## Check-out

To check out all code needed for the Leolani App, clone this repository including all submodules:

        git clone --recurse-submodules -j8 https://github.com/leolani/leolani-mmai-parent.git

Checkout the current state of the parent

        git checkout --recurse-submodules

Update to the current branch heads of the submodules:

        git submodule update --remote

## Run the application

Checkout the repository as described in [Check-out](#check-out). Then go to the repository root, build the project,
activate the virtual environment for the Python application and run it. Altogether:

        git clone --recurse-submodules -j8 https://github.com/leolani/leolani-mmai-parent.git
        cd leolani-mmai-parent
        make build
        cd cltl-leolani-app
        source venv/bin/activate
        cd py-app
        python app-leo.py

NOTES:

- Remember to launch GraphDB and have a repository called 'sandbox'
- Remember to use the virtual environment (created by the `make build`command) located at `cltl-leolani-app/venv`
- You will need to make a folder as such

```bash
mkdir cltl-leolani-app/py-app/data/ 
mkdir cltl-leolani-app/py-app/data/scenarios
```

### Troubleshooting

[comment]: <> (To remove)

- Using the right branches: Make sure to have the right versions of the submodules by pulling the correct branch:

```bash
cd ../cltl-knowledgeextraction
git checkout integration
cd ../cltl-knowledgerepresentation
git checkout integration
cd ../cltl-languagegeneration
git checkout integration
```

- Git submodules: Usually if running the `make build` command fails and complains about missing makefiles the git
  submodule checkout didn’t work properly. You will need to go to the specific submodule and run the checkout in that
  folder. For example, the error:

``` bash
util/make/makefile.parent.mk:57: /Users/selbaez/Documents/PhD/leolani/leolani-mmai-parent/cltl-face-recognition/makefile.d: No such file or directory
```

Would need to got to the `face-recognition` module and run:

``` bash 
cd cltl-face-recognition
git submodule update --init --recursive
```

- Make build: Sometimes, you will need to run `make build` twice, as some errors get fixed only through the first run

## Development

Follow the instructions in [cltl-combot](https://github.com/leolani/cltl-combot).
