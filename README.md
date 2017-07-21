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
4. Ensure ansible is able to ssh to your master and each of your hosts.
5. run `ansible-playbook asb-ci.yml`

Ansible Extra Vars
-------------------
* **jenkins_admin_passwd**: By default the admin password is 'changeme'.
* **custom_cert_file**: Custom SSL cert file to use with nginx. Should already exist on your master.
* **custom_key_file**: Custom SSL key file to use with nginx. Should already exist on your master.
* **letsencrypt**: False if by default. If true and vagrant is undefined it will use certbot to set up letsencrypt certs.
* **letsencrypt_hostname**: hostname to configure for lets encrypt.
* **letsencrypt_email**: email address to use for letsencrypt.
* **slave_executors**: 2 by default.
* **slave_ssh_private_key_file**: By default this is /root/.ssh/id_rsa when not using vagrant. When using vagrant the libvirt private key is used for each host.
* **slave_ssh_username**: The vagrant user will be used regardless of this setting if vagrant is defined, otherwise the default is root.
