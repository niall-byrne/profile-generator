# OSX Machine Profile Generator

## A Mac Maker Profile Development Environment.

[Mac Maker](https://github.com/osx-provisioner/mac_maker) is a simply binary tool for configuring new Mac's with the software/tools you use every day.

(Please see the [cookiecutter documentation](https://cookiecutter.readthedocs.io/) for instructions on how to use this project template.)

##### Master Branch:
[![profile-generator-self-test](https://github.com/osx-provisioner/profile-generator/actions/workflows/self-test.yml/badge.svg?branch=master)](https://github.com/osx-provisioner/profile-generator/actions/workflows/self-test.yml)

##### Production Branch:
[![profile-generator-self-test](https://github.com/osx-provisioner/profile-generator/actions/workflows/self-test.yml/badge.svg?branch=production)](https://github.com/osx-provisioner/profile-generator/actions/workflows/self-test.yml)

## About The Template Defaults

This template generates a development environment for the [Mac Maker](https://github.com/osx-provisioner/mac_maker.git) project, with functional CI/CD.

The default profile has some excellent functionality out of the box:
- Installs the [Homebrew](https://brew.sh/) and [Xcode](https://developer.apple.com/xcode/) cli tools automatically. (You may see some "Please Install Me" popups, safely ignore them and wait for your finished Mac.)
- A centralized package manifest in the [profile/vars/main.yml](./{{cookiecutter.profile_slug}}/profile/vars/main.yml) file.
- A functional [ClamAV](https://github.com/Cisco-Talos/clamav) install to protect you against malicious downloads.
- Node.js and Python, managed by [asdf](https://asdf-vm.com/#/). (Activate these language installs by following [these](https://asdf-vm.com/#/core-manage-asdf) instructions for your shell.)
- Easily mix and match Ansible roles in the [profile/install.yml](./{{cookiecutter.profile_slug}}/profile/install.yml) file.

Use one of the many existing OSX Ansible roles to customize your installation:
- [Mac Maker's Ansible Roles](https://galaxy.ansible.com/osx_provisioner)
- [Jeff Geerling's Ansible Collection](https://galaxy.ansible.com/geerlingguy/mac)
- [Search on Ansible Galaxy](https://galaxy.ansible.com/search?deprecated=false&keywords=osx&order_by=-relevance&page=1)

Update your [profile/requirements.yml](./{{cookiecutter.profile_slug}}/profile/requirements.yml) file to add more [Ansible Galaxy](https://galaxy.ansible.com/) content as needed.

## Quick Start Guide

**First make sure you're using Python 3.8 or later.**

- `pip install cookiecutter poetry`
- `cookiecutter https://github.com/osx-provisioner/mac_maker.git --checkout v0.1.0`

**Give your project a name, and populate the other required template inputs.**

Once the templating is finished:
- `cd <your new project director>`
- `poetry shell` (to interact with the installed linting tools inside a virtualenv)

A `master` branch will be created, allowing you to manage a separate `production` branch in [gitlabflow](https://docs.gitlab.com/ee/topics/gitlab_flow.html) style.

## License

[GNU GPL](LICENSE)

## Adding / Removing Dependencies For Your Project

#### Python Dependencies:

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
  - [workflows](./{{cookiecutter.profile_slug}}/.github/workflows)
