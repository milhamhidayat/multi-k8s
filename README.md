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
- There are 2 type :
    
    * statically privisioned persistent volume : created at beginning
    * dynamically privisoned persistent volume : not created at beginning, will get the config and create it

## Persistent Volume Claim
- Config file to access persistent volume

## Access mode
- ReadWriteOnce : can be used by a single node
- ReadOnlyMany : multiple nodes can read from this
- ReadWriteMany : can be read and written to by many nodes

## Where does kubernetes allocate persistent volume
- Kubernetes will make a slice of your hard drive to create persistent volume in local
- In cloud, it will user cloud storage service
- To see the config

```sh
kubectl get storageclass
```

- To see all persistent volume

```sh
kubectl get pv
```

## Secret
stores a piece of information in the cluster, such as a database password. Use imperative command, because if you use declarative you need to create config for the secret password and anyone who have access able to see the file

```sh
kubectl create secret <generic> <secret_name> --from-literal key=value
```

generic : type of secret, generic, tls or docker registry
secret_name: name of secret, reference in pod config
--from-literal : add secret into this command, as ooposed from file
key=value : key value pair of the secret information

Example : 
```sh
kubectl create secret generic pgpassword --from-literal PGPASSWORD=yourpassword
```

Check:
```sh
kubectl get secrets
```

## LoadBalancer

- service points to external load balancer that are not in your kubernetes cluster. Ex: GCP, AWS
- load balancer only give you access to one set of pods
- Each service exposed with LoadBalancer will get its own IP Address, and have to pay per expose service.
 
## Ingress
- act like a "smart router"
- set a rules to pass to a service
- a way to route traffic, by specifying request path, request domain, and target kubernetes service

## Setting up ingress

Resource : https://kubernetes.github.io/ingress-nginx/deploy/#contents

1. Follow mandatory command
```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
```

2. Add addon in minikube
```sh
minikube addons enable ingress
```

## Dashboard
To check the dashboard, use
```sh
minikube dashboard
```