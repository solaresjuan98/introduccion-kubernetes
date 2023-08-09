FROM node:14-alpine AS builder
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install 
COPY . .
RUN npm run build

FROM nginx:1.19-alpine 
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# # Definir la variable de entorno en la imagen NGINX
# ENV REACT_APP_API_URL=http://34.148.237.47:8080/api
# ENV REACT_APP_SOCKET=http://34.148.237.47:8080/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
