# Polarizometro Deployment

This repository contains the necessary files to deploy the Polarizometro application, including the backend, frontend, and database services using Docker and Docker Compose.

## Files

- `docker-compose.yml`: Docker Compose configuration file to set up and run the services.
- `.env`: Environment variables for the Flask API service.
- `nginx/flask_api.conf`: Nginx configuration file for the Flask API service.
- `deploy.sh`: Script to automate the deployment process.

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

This script will:

- Download the necessary files (`docker-compose.yml`, `.env`, `flask_api.conf`).
- Set up the required directories.
- Run Docker Compose to start the services.

## Services

- **Database**: PostgreSQL database service.
- **Backend**: Flask API service.
- **Frontend**: React frontend service.
- **Nginx**: Nginx reverse proxy for the Flask API service.

## Running the Services

After running the `deploy.sh` script, the services will be up and running. You can access the frontend at **http://localhost:3000** and the backend API at **http://localhost:5000**.

## Stopping the Services

To stop the services, run:

```sh
docker-compose down
```
