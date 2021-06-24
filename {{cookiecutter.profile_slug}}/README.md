# {{cookiecutter.profile_slug}}

### Master:
- [![{{cookiecutter.profile_slug}}](https://github.com/{{cookiecutter.github_handle}}/{{cookiecutter.profile_slug}}/actions/workflows/push.yml/badge.svg?branch=master)](https://github.com/{{cookiecutter.github_handle}}/{{cookiecutter.profile_slug}}/actions/workflows/push.yml)

### Production:
- [![{{cookiecutter.profile_slug}}](https://github.com/{{cookiecutter.github_handle}}/{{cookiecutter.profile_slug}}/actions/workflows/push.yml/badge.svg?branch=production)](https://github.com/{{cookiecutter.github_handle}}/{{cookiecutter.profile_slug}}/actions/workflows/push.yml)

## Mac Maker Profile

{{ cookiecutter.description }}

Use [Mac Maker](https://github.com/osx-provisioner/mac_maker) to apply this profile to a Mac that is ready to setup.

## About The Default Configuration

The template has generated you a development environment for a [Mac Maker](https://github.com/osx-provisioner/mac_maker.git) machine profile, with [functional CI](./.github/workflows/push.yml).

The default configuration has some excellent functionality out of the box:
- Installs the [Homebrew](https://brew.sh/) and [Xcode](https://developer.apple.com/xcode/) cli tools automatically.
  - You may see a "Please Install Me" Xcode popup dialogue, safely ignore this and wait for your finished Mac.
- A centralized package manifest in the [profile/vars/main.yml](./profile/vars/main.yml) file.
- A functional [ClamAV](https://github.com/Cisco-Talos/clamav) install to protect you against malicious downloads.
- Node.js and Python, managed by [asdf](https://asdf-vm.com/#/).
  - Activate these language installs by following [these](https://asdf-vm.com/#/core-manage-asdf) instructions for your shell.
- Easily mix and match Ansible roles in the [profile/install.yml](./profile/install.yml) file.

#### Important Note about ClamAV on Catalina and Big Sur

- To get the most out of your ClamAV install, make sure you grant it "Full Disk Access".
- Please take a quick look at the documentation [here](https://github.com/osx-provisioner/role-clamav).

## This Looks Complicated, How Can I Customize This?

Start [here](./profile/vars/main.yml), it's really much simpler than you might think.

## Making the Default Profile your Own

To start branching out, and really customizing things, get familiar with the following files:

 - [install.yml](profile/install.yml)           
   - This is the main [ansible](https://ansible.com) playbook that will be run when you "Apply" this profile.
 - [requirements.yml](profile/requirements.yml)
   - This is configuration for [ansible-galaxy](https://galaxy.ansible.com/docs/using/installing.html#installing-multiple-roles-from-a-file) dependencies.
   - If you add additional roles, include them here, so your Profile includes everything it needs.
   - Make sure to read the documentation any new roles and add the required variables to your [main vars file](./profile/vars/main.yml).

## Configuration Files (More Complex Knob Tweaking)

There some configuration files you can fine tune as you see fit, they require more familiarity with Ansible:

 - [.ansible-lint](profile/.ansible-lint)
   - This is configuration for [ansible-lint](https://ansible-lint.readthedocs.io/en/latest/), which is used in the included GitHub CI pipeline.
 - [.yamllint.yml](profile/.yamllint.yml)               
   - This is configuration for [yamllint](https://yamllint.readthedocs.io/en/stable/), which is used in the included GitHub CI pipeline.

## Profile Precheck Folder

The `profile` folder contains a special [__precheck__](profile/__precheck__) sub-folder with configuration used by [Mac Maker](https://github.com/osx-provisioner/mac_maker) to help end users apply the Profile to their machines.

Please read the [Mac Maker Profile](https://mac-maker.readthedocs.io/en/latest/project/3.profiles.html) documentation for details on this. (It's a quick read.)

## Developing Your Profile

[Mac Maker](https://github.com/osx-provisioner/mac_maker) can work with public GitHub repositories, or with `spec.json` files.

A Mac Maker Profile has a specific directory structure, but the `spec.json` file lets you mix and match where the directories and files are. It's a bit inflexible in certain ways, because it requires absolute paths, but this makes it ideal to work off a USB stick or any portable media.
When developing your profile locally, it's handy to setup a `spec.json` file that points to all the locations you need, so you can just re-run Mac Maker to test.

Please read the [Mac Maker Job Spec](https://mac-maker.readthedocs.io/en/latest/project/4.spec_files.html) documentation for details on this. (It's a quick read.)

## Default License

An [MIT](LICENSE) license has been generated for you by default, feel free to discard/change as you see fit.
