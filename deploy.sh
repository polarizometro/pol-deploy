#!/bin/bash

# Descargar el archivo docker-compose.yml
curl -O https://raw.githubusercontent.com/polarizometro/pol-deploy/main/docker-compose.yml

# Descargar el archivo .env
curl -O https://raw.githubusercontent.com/polarizometro/pol-deploy/main/.env

# Descargar la configuración de nginx
mkdir -p nginx
curl -o nginx/flask_api.conf https://raw.githubusercontent.com/polarizometro/pol-deploy/main/flask_api.conf

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