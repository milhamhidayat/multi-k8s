docker build -t photon628/multi-client:latest -t photon628/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t photon628/multi-server:latest -t photon628/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t photon628/multi-worker:latest -t photon628/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push photon628/multi-client:latest
docker push photon628/multi-server:latest
docker push photon628/multi-worker:latest
docker push photon628/multi-client:$SHA
docker push photon628/multi-server:$SHA
docker push photon628/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=photon628/multi-server:$SHA
kubectl set image deployments/client-deployment client=photon628/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=photon628/multi-worker:$SHA