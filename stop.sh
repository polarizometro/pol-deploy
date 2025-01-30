#!/bin/bash

# Verificar y detener contenedores en conflicto
containers=("polarizometro-react-frontend" "polarizometro-flask-api" "polarizometro-db" "polarizometro-nginx")

for container in "${containers[@]}"; do
  if [ "$(docker ps -aq -f name=$container)" ]; then
    echo "Stopping and removing container: $container"
    docker rm -f $container
  fi
done

# Detener y eliminar los servicios definidos en docker-compose.yml
docker-compose down