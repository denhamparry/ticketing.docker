docker run --name ticketing.messaging --network=ticketing-network -d rabbitmq:3-management
docker run --name ticketing.mongo --network=ticketing-network -d mongo
docker run --name ticketing.api --network=ticketing-network -d -p 3000:80 denhamparry/ticketing.api:local