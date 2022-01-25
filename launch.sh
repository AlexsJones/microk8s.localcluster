#!/bin/sh
## Run a multi-node microk8s cluster with LXD
microk8s start
for i in {1..3}
do
workerToken=`microk8s.add-node | grep " --worker"`
echo "Starting ubuntu$i"
lxc init ubuntu:20.04 ubuntu$i --vm
(
cat << EOF
#cloud-config
apt_mirror: http://us.archive.ubuntu.com/ubuntu/
ssh_pwauth: yes
users:
  - name: ubuntu
    passwd: $6$rounds=4096$Y4osIf0bw1NQHpyS$CQF0ZoRpftVY50WSiyHkmgSfsAVQHpKdOckzgoUUwDC9FVFOa/3isL/LvovBo3D8/0VUWfswKCuraqZ1w1qln.
    lock_passwd: false
    groups: lxd
    shell: /bin/bash
    sudo: ALL=(ALL) NOPASSWD:ALL
runcmd:
  - sudo apt update -y
  - sudo snap install microk8s --classic
  - ${workerToken}
final_message: "The system is finally up, after $UPTIME seconds"
EOF
) | lxc config set ubuntu$i user.user-data -
lxc config device add ubuntu$i config disk source=cloud-init:config
lxc start ubuntu$i
done
