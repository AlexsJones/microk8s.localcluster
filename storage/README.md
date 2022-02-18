# storage

## Prepage the cluster

```
echo 1024 | sudo tee /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
```

```
echo vm.nr_hugepages = 1024 | sudo tee -a /etc/sysctl.conf
```

_Labels nodes_

```
 microk8s kubectl label node <node_name> openebs.io/engine=mayastor
 ```

## Pre-installation

Provisioning the loopback device storage
- `dd if=/dev/zero of=loopbackfile.img bs=100M count=10`
- `sudo losetup -fP loopbackfile.img`
- `mkfs.ext4 loopbackfile.img`
- Find the loop device 
```
losetup -a | grep loopbackfile
/dev/loop27: []: (/home/jonesax/microk8s.localcluster/storage/loopbackfile.img)
```
- `mkdir /loopfs`
- Mount device `sudo mount -o loop /dev/loop27 /loopfs`
- Check it out...
```
df -hP /loopfs/
Filesystem      Size  Used Avail Use% Mounted on
/dev/loop27     966M   24K  900M   1% /loopfs

```
## Installation

- `source ./install-storage.sh`
- kubectl edit sts/mayastor-etcd and remove anti-affinity
- Edit this to match your device name and your loop path `microk8s kubectl apply -f mayastorpool.yaml`
- `microk8s kubectl apply -f storageclass.yaml`


### Testing

Test all this madness works with the test-app.yaml which uses the new storage class

`microk8s kubectl apply -f test-app.yaml`
