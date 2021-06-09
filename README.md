# Mac Maker Profile Generator

[Mac Maker](https://github.com/osx-provisioner/mac_maker) is a single binary executable for configuring new Mac's with the software/tools you use every day.

##### Master Branch:
[![profile-generator-self-test](https://github.com/osx-provisioner/profile-generator/actions/workflows/self-test.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/profile-generator/actions/workflows/self-test.yml)

##### Production Branch:
[![profile-generator-self-test](https://github.com/osx-provisioner/profile-generator/actions/workflows/self-test.yml/badge.svg?branch=production)](https://github.com/osx-provisioner/profile-generator/actions/workflows/self-test.yml)

## Quick Start Guide

### 1. First make sure you're using Python 3.8 or later.
- `pip install cookiecutter poetry`
- `cookiecutter https://github.com/osx-provisioner/mac_maker.git --checkout v0.2.0`

### 2. Give your project a name, and populate the other required template inputs.
- [Cookiecutter](https://cookiecutter.readthedocs.io/) will prompt you to enter some information such as the Profile's name, and your GitHub user handle. 

### 3. Wait for the Template to Render and the Virtual Environment to be Generated.
- A [virtualenv](https://docs.python.org/3.8/library/venv.html) will be created for you automatically using [Poetry](https://python-poetry.org/).

### 4. Start Customizing.
- `cd <your new project director>`
- `poetry shell` (to interact with the installed linting tools inside the virtualenv)

## About This Template

This template uses a tool called [cookiecutter](https://cookiecutter.readthedocs.io/) to generate a Mac Maker Profile customized for you.

The default configuration has some excellent functionality out of the box:
- Installs the [Homebrew](https://brew.sh/) and [Xcode](https://developer.apple.com/xcode/) cli tools automatically.
  - You may see a "Please Install Me" Xcode popup dialogue, safely ignore this and wait for your finished Mac.
- A centralized package manifest in the [profile/vars/main.yml](./{{cookiecutter.profile_slug}}/profile/vars/main.yml) file.
- A functional [ClamAV](https://github.com/Cisco-Talos/clamav) install to protect you against malicious downloads.
- Node.js and Python, managed by [asdf](https://asdf-vm.com/#/).
  - Activate these language installs by following [these](https://asdf-vm.com/#/core-manage-asdf) instructions for your shell.
- Easily mix and match Ansible roles in the [profile/install.yml](./{{cookiecutter.profile_slug}}/profile/install.yml) file.

Use one of the many existing OSX Ansible roles to customize your installation:
- [Mac Maker's Ansible Roles](https://galaxy.ansible.com/osx_provisioner)
- [Jeff Geerling's Ansible Collection](https://galaxy.ansible.com/geerlingguy/mac)
- [Search on Ansible Galaxy](https://galaxy.ansible.com/search?deprecated=false&keywords=osx&order_by=-relevance&page=1)

Update your [profile/requirements.yml](./{{cookiecutter.profile_slug}}/profile/requirements.yml) file to add more [Ansible Galaxy](https://galaxy.ansible.com/) content as needed.

## License

[GNU GPL](LICENSE)

## Python Customization

If for some reason you need to customize the Python development environment for the template, you can do so using [Poetry](https://python-poetry.org/).

#### Managing Python Dependencies:

Use the [pyproject.toml](./{{cookiecutter.profile_slug}}/pyproject.toml) file to store your project dependencies in accordance with [PEP 518](https://www.python.org/dev/peps/pep-0518/) and [Poetry Dependency Management](https://python-poetry.org/docs/pyproject/#dependencies-and-dev-dependencies).

Poetry is leveraged to manage the Python dependencies:
- [Adding Python Packages with Poetry](https://python-poetry.org/docs/cli/#add)
- [Removing Python Packages With Poetry](https://python-poetry.org/docs/cli/#remove)

## Default Installed Python Packages:
| package      | Description                                  |
| ------------ | -------------------------------------------- |
| ansible      | Simple, agentless IT automation              |
| ansible-lint | Checks playbooks for practices and behaviour |
| commitizen   | Standardizes commit messages                 |
| poetry       | Python package manager                       |
| yamllint     | Lints yaml configuration files               |

## Third Party Integrations

Integrations with the following third party services are configured during templating:

- [GitHub Workflows](https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions)
  - The templated workflows can be found [here](./{{cookiecutter.profile_slug}}/.github/workflows).
