# Imagen base de Nginx
FROM nginx:alpine


RUN apk add --no-cache curl

WORKDIR /test

FROM  base as test
# Copiamos nuestro HTML personalizado al directorio que Nginx sirve por defecto
COPY index.html /usr/share/nginx/html/index.html

# Exponemos el puerto 80
EXPOSE 80

HEALTHCHECK CMD curl -f http://localhost || exit 1

FROM base as final