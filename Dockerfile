# Usar la última versión de Ubuntu como imagen base
FROM ubuntu:latest

# Instalar dependencias necesarias para clonar el repositorio y ejecutar Nginx
RUN apt update && apt install -y \
    git \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Clonar el repositorio en el directorio de Nginx
RUN git clone https://github.com/JAAS210299/sass.git /tmp/sass && mv /tmp/sass/* /var/www/html/

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
