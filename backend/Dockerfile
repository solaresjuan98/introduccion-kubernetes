# syntax=docker/dockerfile:1
FROM node:16-alpine

# Define las variables de entorno
ENV PORT=8080
ENV DB_CNN_STRING="mongodb://35.190.128.53:27017/chatdb"

WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY . .

CMD [ "npm", "start" ]
