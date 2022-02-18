# storage

## Pre-installation

Provisioning the loopback device storage



## Installation

- `source ./install-storage.sh`
- kubectl edit sts/mayastor-etcd and remove anti-affinity
- EDIT THIS TO MAP TO YOUR DEVICE AND STORAGE `microk8s kubectl apply -f mayastorpool.yaml`
- `microk8s kubectl apply -f storageclass.yaml`
