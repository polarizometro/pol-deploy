# Polarizometro Deployment

This repository contains the necessary files to deploy the Polarizometro application, including the backend, frontend, and database services using Docker and Docker Compose.

## Files

- `docker-compose.yml`: Docker Compose configuration file to set up and run the services.
- `.env`: Environment variables for the Flask API service.
- `nginx/flask_api.conf`: Nginx configuration file for the Flask API service.
- `deploy.sh`: Script to automate the deployment process.
- `stop.sh`: Script to stop and remove the services.

## Prerequisites

- Docker
- Docker Compose

## Deployment Instructions

1. **Clone the repository**:

```sh
git clone https://github.com/your-username/your-repository.git
cd your-repository
```

2. **Make the deploy script executable**:

```sh
chmod +x deploy.sh
```

3. **Run the deploy script**:

```sh
./deploy.sh
```

During the execution of the script, you will be prompted to enter your OPENAI4_API_KEY.

This script will:

- Download the necessary files (`docker-compose.yml`, `.env`, `flask_api.conf`).
- Set up the required directories.
- Add the OPENAI4_API_KEY to the .env file.
- Run Docker Compose to start the services.

## Services

- **Database**: PostgreSQL database service.
- **Backend**: Flask API service.
- **Frontend**: React frontend service.
- **Nginx**: Nginx reverse proxy for the Flask API service.

## Running the Services

After running the `deploy.sh` script, the services will be up and running. You can access the frontend at **http://localhost:3000** and the backend API at **http://localhost:5000**.

## Viewing Logs

To view the logs of the backend service, run:

```sh
docker logs -f polarizometro-flask-api
```

## Stopping the Services

To stop the services, make the stop script executable:

```sh
chmod +x stop.sh
```

And run the stop script:

```sh
./stop.sh
```
