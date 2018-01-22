# Cheat sheets and checklists

- Student name: Robin Roelandt
- Github repo: https://github.com/RobinRoelandt/elnx-sme

## Basic commands

| Task                | Command |
| :---                | :---    |
| Query IP-adress(es) | `ip a`  |
| Check error logfiles| `sudo journalctl -xe` |
| Change keyboard layout to azerty| `sudo loadkeys be` |

## Git workflow

Simple workflow for a personal project without other contributors:

| Task                                         | Command                   |
| :---                                         | :---                      |
| Current project status                       | `git status`              |
| Select files to be committed                 | `git add FILE...`         |
| Commit changes to local repository           | `git commit -m 'MESSAGE'` |
| Push local changes to remote repository      | `git push`                |
| Pull changes from remote repository to local | `git pull`                |

## Checklist network configuration

1. Is the IP-adress correct? `ip a`
2. Is the router/default gateway correct? `ip r -n`
3. Is a DNS-server available? `cat /etc/resolv.conf`


## Vagrant

| Task                       | Command                |
| :---                       | :---                   |
| Status                     | `vagrant status`       |
| Power up virtual machine   | `vagrant up VM`        |
| Provide changes to machine | `vagrant provision`    |
| Remove a VM                | `vagrant destroy VM`   |
| Execute roles script       | `./scripts/roles-deps.sh` |


## VyOS

| Task              | Command           |
| :---              | :---              |
| IP Configuration  | `show interfaces` |
| Show configuration|`show`             |
| Routing           |`show ip route`    |
| Show log          |`show log tail`    |
