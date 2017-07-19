ASB-CI
======
Set up an Ansible Service Broker CI Environment

Vagrant
-------
Run `vagrant up`

Baremetal
---------
1. Set up your hosts with CentOS 7
2. Install Ansible wherever you want to run it
3. Configure /etc/ansible/hosts with two groups named jenkins_master and jenkins_slaves. You should have 1 master and 0 or more slaves.
4.) run `ansible-playbook asb-ci.yml`

Extra Vars
----------
jenkins_admin_passwd: By default the admin password is changeme. Set this to change it.
