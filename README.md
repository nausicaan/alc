# ALC

ALC is an Ansible playbook, which together with two Ruby scripts, gathers and downloads all achived PDF's for storage.

## Prerequisites

Variables declared in a defaults/main.yaml file:

- VAULT: Location to store files.
- URL: ALC root domain.

```ansible
- name: Discover what needs to be downloaded
  ansible.builtin.script:
    cmd: exists.rb {{ VAULT }} {{ URL }}
```

## Run

Navigate to the folder containing your ***playbook.yaml*** file and run:

```console
ansible-playbook playbook.yaml
```

## License

Code is distributed under [The Unlicense](https://github.com/nausicaan/free/blob/main/LICENSE.md) and is part of the Public Domain.