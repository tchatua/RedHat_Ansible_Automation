---
- name: Include Task Playbook
  hosts: dev
  become: true

  tasks:
    - import_tasks: a04_01_pkgtask.yml
    - import_tasks: a04_02_pkgrem.yml
    - import_tasks: a04_03_multitasks.yml
