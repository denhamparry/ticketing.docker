docker run --name ticketing.messaging --network=ticketing-network -d rabbitmq:3-management
docker run --name ticketing.mongo --network=ticketing-network -d mongo
docker run --name ticketing.api --network=ticketing-network -d -p 3000:80 denhamparry/ticketing.api:latest
sleep 10s
docker run --name ticketing.web --network=ticketing-network -d -p 3001:80 denhamparry/ticketing.web:latest
docker run --name ticketing.worker --network=ticketing-network -d denhamparry/ticketing.worker:latest