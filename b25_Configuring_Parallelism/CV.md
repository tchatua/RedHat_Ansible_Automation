Résumé Extract — DevOps / Automation Engineer (Ansible‑Focused)
Professional Summary
DevOps Automation Engineer with strong expertise in Ansible, Linux systems, and infrastructure automation. Demonstrates mastery in configuration management, parallel execution tuning, templating, fact‑driven automation, SELinux management, and idempotent workflow design. Adept at optimizing Ansible performance using forks, serial execution, handlers, and best‑practice playbook structure. Known for producing clean, enterprise‑grade automation with clear documentation and reproducible results.

Core Competencies
Ansible Automation

Playbook design, roles, handlers, templates, variables, facts, filters

Performance tuning using forks, serial, and parallelism strategies

Idempotent configuration management and service orchestration

Fact gathering optimization and selective filtering

Remote vs controller file operations (remote_src, template, copy, file)

SELinux configuration using ansible.posix.selinux

Linux Systems (RHEL / Rocky / Ubuntu)

Package management (YUM/DNF/APT)

Service management (systemd)

SELinux enforcing/permissive transitions

Log management and system hardening

Infrastructure Optimization

Benchmarking automation speed using time

Measuring performance impact of forks (1 vs 2 vs default 5)

Controlled rolling updates using serial: 1

Safe service restarts using handlers

Highlighted Technical Achievements
1. Parallelism & Forks Optimization
Demonstrated ability to tune Ansible execution speed by adjusting:

forks in ansible.cfg

serial for controlled rolling deployments

Benchmarked execution times:

1 fork → ~9 seconds

2 forks → ~4.7 seconds

serial: 1 → ~6.9 seconds

Showed deep understanding of how Ansible concurrency affects:

fact gathering

task execution

handler invocation

2. Advanced Template & Fact Usage
Built Jinja2 templates using:

ansible_facts['default_ipv4']['address']

ansible_managed

Rendered templates cleanly and deployed them to remote systems.

3. Correct Remote File Handling
Identified and fixed issues involving:

copy vs file module

controller‑side vs remote‑side file paths

proper use of remote_src: true

4. SELinux Enforcement Automation
Successfully transitioned RHEL9 hosts from Permissive → Enforcing using:

/etc/selinux/config

ansible.posix.selinux module

runtime + persistent enforcement

Tools & Technologies
Automation: Ansible, YAML, Jinja2

Linux: RHEL 9, Rocky, Ubuntu, SELinux, systemd

Networking: SSH, IPv4 facts, service ports

Version Control: Git

Cloud: AWS EC2 (based on your lab environment)

Soft Skills
Strong troubleshooting and root‑cause analysis

Clear, structured documentation

Enterprise‑grade workflow design

Precision, discipline, and operational reliability

If you want, I can turn this into:

a full résumé,

a LinkedIn‑ready profile,

a portfolio case study, or

a DevOps project write‑up

Just tell me which direction you want to take.