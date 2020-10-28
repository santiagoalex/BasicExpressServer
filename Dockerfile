# Establece la imagenBase xdxdxdd
FROM node

# Se estable el directorio de trabajo
WORKDIR /opt/app

# Instala los paquetes existentes en el package.json
COPY package*.json ./

