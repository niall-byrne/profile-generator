# Mac Maker Profile Generator

[Mac Maker](https://github.com/osx-provisioner/mac_maker) is a single binary executable for configuring new Mac's with the software/tools you use every day.

- This repository allows you to generate an example Mac Maker [Profile](https://github.com/osx-provisioner/mac_maker#mac-maker-profiles) which you can quickly customize for personal use.
- It's intended as a starting point to put your system under idempotent, declarative version control. 

The configuration files themselves comprise a customized [Ansible](https://www.ansible.com/) playbook, allowing you to leverage Ansible's robust tool chain with minimal fuss.

##### Master Branch (Follows the latest production tag):
[![profile-generator-template-test](https://github.com/osx-provisioner/profile-generator/actions/workflows/workflow-template-test.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/profile-generator/actions/workflows/workflow-template-test.yml)

##### Dev Branch:
[![profile-generator-template-test](https://github.com/osx-provisioner/profile-generator/actions/workflows/workflow-template-test.yml/badge.svg?branch=dev)](https://github.com/osx-provisioner/profile-generator/actions/workflows/workflow-template-test.yml)

## Quick Start Guide

### 1. First make sure you're using Python 3.9 or later.
- `python3 -m pip install cookiecutter poetry`
- `cookiecutter https://github.com/osx-provisioner/profile-generator`

### 2. Give your project a name, and populate the other required template inputs.
- [Cookiecutter](https://cookiecutter.readthedocs.io/) will prompt you to enter some information such as the Profile's name, and your GitHub user handle. 

### 3. Wait for the Template to Render and the Virtual Environment to be Generated.
- A [virtualenv](https://docs.python.org/3.9/library/venv.html) will be created for you automatically using [Poetry](https://python-poetry.org/).

### 4. Start Customizing.
- `cd <your new project director>`
- `poetry shell` (to interact with the installed linting tools inside the virtualenv)

## About This Template

This template uses a tool called [cookiecutter](https://cookiecutter.readthedocs.io/) to generate a Mac Maker Profile customized for you.

The default configuration has some excellent functionality out of the box:
- Installs the [Homebrew](https://brew.sh/) cli tool, with selected packages.
  - You may see a "Please Install Me" Xcode popup dialogue, safely ignore this and wait for your finished Mac.
- A centralized package manifest in the [profile/vars/main.yml](./{{cookiecutter.project_slug}}/profile/vars/main.yml) file.
- A functional [ClamAV](https://github.com/Cisco-Talos/clamav) install to protect you against malicious downloads.
- Node.js and Python, managed by [asdf](https://asdf-vm.com/#/).
  - Activate these language installs by following [these](https://asdf-vm.com/#/core-manage-asdf) instructions for your shell.
- Easily mix and match Ansible roles in the [profile/install.yml](./{{cookiecutter.project_slug}}/profile/install.yml) file.

Use one of the many existing OSX Ansible roles to customize your installation:
- [Mac Maker's Ansible Roles](https://galaxy.ansible.com/osx_provisioner)
- [Jeff Geerling's Ansible Collection](https://galaxy.ansible.com/geerlingguy/mac)
- [Search on Ansible Galaxy](https://galaxy.ansible.com/search?deprecated=false&keywords=osx&order_by=-relevance&page=1)

Update your [profile/requirements.yml](./{{cookiecutter.project_slug}}/profile/requirements.yml) file to add more [Ansible Galaxy](https://galaxy.ansible.com/) content as needed.

## Python Customization

If for some reason you need to customize the Python development environment for the template, you can do so using [Poetry](https://python-poetry.org/).

#### Managing Python Dependencies:

Use the [pyproject.toml](./{{cookiecutter.project_slug}}/pyproject.toml) file to store your project dependencies in accordance with [PEP 518](https://www.python.org/dev/peps/pep-0518/) and [Poetry Dependency Management](https://python-poetry.org/docs/pyproject/#dependencies-and-dev-dependencies).

Poetry is leveraged to manage the Python dependencies:
- [Adding Python Packages with Poetry](https://python-poetry.org/docs/cli/#add)
- [Removing Python Packages With Poetry](https://python-poetry.org/docs/cli/#remove)

You can also conveniently execute commands inside the Python virtual environment by using: `poetry run [my command here]`

### Default Installed Python Packages:
| package      | Description                                        |
| ------------ | -------------------------------------------------- |
| ansible      | Simple, agentless IT automation.                   |
| ansible-lint | Checks playbooks for best practices and behaviour. |
| commitizen   | Standardizes git commit messages.                  |
| poetry       | Python package and dependency manager.             |
| yamllint     | Lints yaml files.                                  |

### Maintaining your pyproject.toml File

The template also presents the option to create a pre-commit hook, and a GitHub workflow step to format the [pyproject.toml](./{{cookiecutter.project_slug}}/pyproject.toml) file:
- This is accomplished via the golang binary [tomll](https://github.com/pelletier/go-toml).
- This is the most robust TOML formatter I'm aware of right now.
- However, to use it, you'll need to install the binary on your locale system.

If you'd like to install it and give it a try:
- You can download the latest darwin binary [here](https://github.com/pelletier/go-toml/releases).
- Alternatively, you can compile the tool yourself fairly easily from [source](https://github.com/pelletier/go-toml).
  - If you have go installed: `$ go install github.com/pelletier/go-toml/v2/cmd/tomll@latest`

## Pre-Commit Git Hooks
The python library [pre-commit](https://pre-commit.com/) comes installed with a few useful initial hooks:

### Default Pre-Commit Hooks:
| Hook Name          | Description                                                                                                  |
| ------------------ | ------------------------------------------------------------------------------------------------------------ |
| ansible-lint       | Checks your profile for best Ansible practices and behaviour.                                                |
| commitizen         | Runs [commitizen](https://commitizen-tools.github.io/commitizen/) on your commit message to validate it.     |
| pyproject.toml     | Optionally runs [tomll](https://github.com/pelletier/go-toml) on your TOML configuration file.               |

## Restricted Paths

Certain versions of the Ansible tool chain *may* use these folders, which you would be best to avoid:
- .ansible/
- .cache/
- profile/.ansible/
- profile/.cache/

Mac Maker itself also writes some data overtop of the role (ephemerally at run time) in order to process it, this means there are a few paths that you should shy away from using:
- spec.json **\***
- profile/.mac_maker/
- profile/collections/ **\***
- profile/env/ **\***
- profile/inventory/ **\***
- profile/roles/ **\***
  
**\*** **(these paths are marked for deprecation, soon freeing them up for use)**

## License

[GNU GPL](LICENSE)