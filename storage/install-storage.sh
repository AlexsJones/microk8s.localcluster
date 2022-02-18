kubectl create namespace mayastor
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor-control-plane/master/deploy/operator-rbac.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor-control-plane/master/deploy/mayastorpoolcrd.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor/master/deploy/nats-deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor/develop/deploy/etcd/storage/localpv.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor/master/deploy/etcd/statefulset.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor/master/deploy/etcd/svc.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor/master/deploy/etcd/svc-headless.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor/master/deploy/csi-daemonset.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor-control-plane/master/deploy/core-agents-deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor-control-plane/master/deploy/rest-deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor-control-plane/master/deploy/rest-service.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor-control-plane/master/deploy/csi-deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor-control-plane/master/deploy/msp-deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/openebs/mayastor/master/deploy/mayastor-daemonset.yaml

kubectl scale --replicas=1 sts/mayastor-etcd -n mayastor
kubectl scale --replicas=1 sts/nats -n mayastor
