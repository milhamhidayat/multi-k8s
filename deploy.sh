docker build -t photon628/multi-client -f ./client/Dockerfile ./client
docker build -t photon628/multi-server -f ./server/Dockerfile ./server
docker build -t photon628/multi-worker -f ./worker/Dockerfile ./worker
docker push photon628/multi-client
docker push photon628/multi-server
docker push photon628/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=photon628/multi-server