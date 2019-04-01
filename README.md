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