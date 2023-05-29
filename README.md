# ALC

ALC gathers and downloads all achived PDF's for storage.

## Prerequisites

Variables declared in a defaults/main.yaml file:

- SOT: Location of your *source of truth* file
- SHORT: https://
- VAULT: Location to store files
- URL: ALC root domain

```console
- name: Discover what needs to be downloaded
  ansible.builtin.script:
  cmd: exists.rb {{ VAULT }} {{ URL }} {{ SOT }}
```

## Run

Navigate to the folder containing your scripts and run:

```console
./download.rb
```

This will call the ansible playbook:

```console
PLAY [Download ALC Assets] *****************************************************

TASK [Run exists.rb] ***********************************************************
changed: [127.0.0.1]

PLAY RECAP *********************************************************************
127.0.0.1 : ok=1    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## License

Code is distributed under [The Unlicense](https://github.com/nausicaan/free/blob/main/LICENSE.md) and is part of the Public Domain.