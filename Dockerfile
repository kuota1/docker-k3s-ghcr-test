# Imagen base de Nginx
FROM nginx:alpine 
# Copiamos nuestro HTML personalizado al directorio que Nginx sirve por defecto
COPY index.html /usr/share/nginx/html/index.html

# Exponemos el puerto 80
EXPOSE 80

HEALTHCHECK CMD curl -f http://localhost || exit 1

