# Valhalla

Ansible-based configuration for my Raspberry Pi server.

## Prerequisites

- [Nix](https://nixos.org/download/) with flakes enabled
- SSH access to the Raspberry Pi at `192.168.1.56`

## Setup

Enter the Nix dev shell to get Ansible and all dependencies:

```bash
nix develop
```

## Running the playbooks

### Install Podman

```bash
ansible-playbook ansible/playbooks/install_podman.yml --ask-become-pass
```

> The `--ask-become-pass` flag prompts for the `sudo` password on the Raspberry Pi.

## Project structure

```
.
├── ansible.cfg                          # Ansible configuration
├── ansible/
│   ├── inventory/
│   │   └── hosts.ini                    # Raspberry Pi host definition
│   └── playbooks/
│       └── install_podman.yml           # Podman installation playbook
└── flake.nix                            # Nix dev shell with Ansible
```
