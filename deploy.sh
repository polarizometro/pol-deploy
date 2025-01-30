#!/bin/bash

if [ -d "data" ]; then
  sudo rm -rf data
fi

# Descargar el archivo docker-compose.yml
curl -O https://raw.githubusercontent.com/polarizometro/pol-deploy/main/docker-compose.yml

# Descargar la configuración de nginx
mkdir -p nginx
curl -o nginx/flask_api.conf https://raw.githubusercontent.com/polarizometro/pol-deploy/main/flask_api.conf

# Preguntar si el usuario quiere introducir la clave OPENAI4_API_KEY
read -p 'Do you want to enter the OPENAI4_API_KEY? (y/n): ' response

if [ "$response" != "y" ]; then
  echo "Please enter the OPENAI4_API_KEY to proceed. Exiting..."
  exit 1
fi

# Solicitar la clave OPENAI4_API_KEY al usuario
read -sp 'Enter your OPENAI4_API_KEY: ' OPENAI4_API_KEY
echo

# Añadir la clave OPENAI4_API_KEY al archivo .env en una nueva línea
echo -e "\nOPENAI4_API_KEY=$OPENAI4_API_KEY" >> .env

# Verificar y eliminar contenedores en conflicto
containers=("polarizometro-react-frontend" "polarizometro-flask-api" "polarizometro-db" "polarizometro-nginx")

for container in "${containers[@]}"; do
  if [ "$(docker ps -aq -f name=$container)" ]; then
    echo "Removing existing container: $container"
    docker rm -f $container
  fi
done

# Ejecutar docker-compose
docker-compose up -d

# Verificar que todos los contenedores están corriendo
echo "Verifying that all containers are running..."
for container in "${containers[@]}"; do
  if [ "$(docker ps -q -f name=$container)" ]; then
    echo "Container $container is running."
  else
    echo "Error: Container $container is not running."
    exit 1
  fi
done

echo "All containers are up and running."