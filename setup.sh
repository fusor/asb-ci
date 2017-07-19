#!/bin/bash

ifup eth1 2>&1 > /dev/null

if [ "${JENKINS_ROLE}" == "master" ]; then
  yum -y install epel-release && yum -y install ansible

  if [ "${SLAVES}" > "0" ]; then
    for i in $(seq 0 $(expr ${SLAVES} - 1) ); do
      IP=$(expr ${i} + 10)
      while !(exec 3<>/dev/tcp/192.168.119.${IP}/22); do
        echo 192.168.119.${IP} is not up yet.
        sleep 5
      done
    done
  fi

  ansible-playbook /vagrant/asb-ci.yml --extra-vars "{\"jenkins_slaves\":\"${SLAVES}\", \"vagrant\":true}"

fi
