# multi-k8s
Multi k8s from kubernetes course, deployed to gcp

## ClusterIP

Service memungkinkan object pods dapat diakses oleh objek lain hanya di dalam kubernetes

## Delete object

```sh
kubectl delete <object> <object name>
```

Example:
```sh
kubectl delete service client-node-port
```

## Apply config

```sh
kubectl apply -f <folder>
```

Example:
```sh
kubectl apply -f k8s
```

## Volume 

* Volume in container
Mechanism allow a container to access a filesystem outside itself

* Volume in kubernetes
Object that allows a container to store data at the pod level

Volume is tied to the pod, if a pod is deleted and kubernetes volume will be deleted as well


## Persistent volume
- outside pod
- don't have tight integration with pod
- if the pod crash or deleted, it will still persist
