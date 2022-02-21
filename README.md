# microk8s.localcluster

![m](./images/index.png)

A multi-node local microk8s example.
This uses LXD and is designed to work on Ubuntu.

_In this example we use a single control plane node - you can use as many as you like_

![microk8s](./images/microk8s-local.png)

## Up and running

```
./launch.sh
```

## Storage

This project implements [mayastor](https://mayastor.gitbook.io/) driver from MayaData.

Check out the steps [here](https://github.com/AlexsJones/microk8s.localcluster/blob/main/storage/README.md)

## Dependencies

- Microk8s ( sudo snap install microk8s --classic )

You can now emulate a generic kubernetes cluster with external load balancing.
