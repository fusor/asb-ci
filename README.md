ASB-CI
======
Set up an Ansible Service Broker CI Environment. This will either set up a single host or a master with as many additional slaves as you specify.

Vagrant
-------
Run `vagrant up` to get one host or `SLAVES=3 vagrant up` to get a master and three slaves.

Baremetal
---------
1. Set up your hosts with CentOS 7
2. Install Ansible wherever you want to run it
3. Configure /etc/ansible/hosts with two groups named jenkins_master and jenkins_slaves. You should have 1 master and 0 or more slaves.
4.) run `ansible-playbook asb-ci.yml`

Extra Vars
----------
jenkins_admin_passwd: By default the admin password is changeme. Set this to change it.
