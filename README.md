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

To pull the latest changes, you can run:

        git pull --recurse-submodules

To push some submodule changes, go to the submodule folder and push like:

        git push origin HEAD:main

## Run the application

Checkout the repository as described in [Check-out](#check-out). Then go to the repository root, build the project,
activate the virtual environment for the Python application and run it. Altogether:

        git clone --recurse-submodules -j8 https://github.com/leolani/leolani-mmai-parent.git
        cd leolani-mmai-parent
        make build
        cd cltl-leolani-app
        source venv/bin/activate
        cd py-app
        python app.py

You can then go to the chat interface [here](http://0.0.0.0:8000/chatui/static/chat.html) to type and see what the
system hears. You can also see what the systems sees [here](http://0.0.0.0:8000/monitoring/static/monitoring.html).

NOTES:

- The `make build` may take 5 - 10 min
- Remember to launch GraphDB and have a repository called 'sandbox'
- Remember to launch Docker before running
- Remember to use the virtual environment (created by the `make build`command) located at `cltl-leolani-app/venv`

### Run in the robot

Please go to `cltl-leolani-app/py-app/config/default.config` and change

* the `server_image_url` and `server_audio_url` fields under `[cltl.backend]`
* the `remote_url` field under `[cltl.backend.text_output]`
* Get wireless internet on your laptop (eg, eduroam), and connect with a wire to the PepperLinkSyss modem
* Get your ip as such `ipconfig getifaddr en7` (eg, 192.168.1.192)

## Troubleshooting

- Bad initialization of Git Submodules: Usually, if running the `make build` command fails and complains about missing
  makefiles the git submodule checkout didn’t work properly. You will need to go to the specific submodule and run the
  checkout in that folder. For example, the error:

  ``` bash
  error: util/make/makefile.parent.mk:57: /YOUR_PATH/leolani-mmai-parent/cltl-face-recognition/makefile.d: No such file or directory
  ```

  Would need to got to the `face-recognition` module and run:

  ``` bash 
  cd cltl-face-recognition
  git submodule update --init --recursive
  ```

- Unable to pull due to unwanted changes: Sometimes when running `git pull --recurse-submodules` you may get an error as
  such:

  ```bash
  error: Your local changes to the following files would be overwritten by checkout:
          VERSION
  
  ```

  For which you have to stash all changes in each submodule. You can use the following command

  ```bash
  git submodule foreach 'git stash'
  ```

- Dependency errors: Sometimes there are versioning problems among the submodules or packages required for the app. This
  might look like this:

  ```bash
  INFO: pip is looking at multiple versions of cltl-reply-generation[service] to determine which version is compatible with other requirements. This could take a while.
  ERROR: Cannot install cltl.reply-generation because these package versions have conflicting dependencies.
  ```

  In this case removing the cache helps. You can do it like so:

  ```bash 
  pip cache purge
  ```

- Direct fetching of a commit in a submodule fails: Sometimes the submodules are unable to pull the latest changes as it
  cannot find a specific commit. Therror looks like this:

  ```bash
  Fetched in submodule path 'cltl-about-agent', but it did not contain 017668c1d9dbb36c858fa803fd6285e1236c7d38. Direct fetching of that commit failed.
  ```

  For this you can force the initialization of the submodules as follows:

  ```bash
  git submodule update --force --recursive --init --remote
  ```

- Make build: Sometimes, you will need to run `make build` twice, as some errors get fixed only through the first run.
  Some other times you need to first run `make clean` and then `make build`.

- Docker already running: Sometimes when you kill (not stop) an application, the docker images will not close correctly.
  You might need to stop them manually.

## Development

Follow the instructions in [cltl-combot](https://github.com/leolani/cltl-combot).
