#!/bin/bash

# Generar build en Docker
docker build -t chat_backend .
#docker build -t chat_backend --build-arg http://34.74.197.245:8080/ .


# * Alternativa 1: Con artifact registry
docker tag chat_backend us-central1-docker.pkg.dev/my-devops-project-392822/conferencia/chat_backend:v3
docker push us-central1-docker.pkg.dev/my-devops-project-392822/conferencia/chat_backend:v3

# * Alternativa 2: Usando container registry (obsoleto)
# docker tag ticket_server gcr.io/my-devops-project-392822/ejemplo/server:latest
# docker push gcr.io/my-devops-project-392822/ejemplo/server:latest

