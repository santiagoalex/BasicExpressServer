# Establece la imagenBase xdxdxdd
FROM node

# Se estable el directorio de trabajo
WORKDIR /opt/app

# Instala los paquetes existentes en el package.json
COPY package*.json ./

RUN npm install 

# Copia la Aplicacion
COPY . .

# Expone la aplicaciÃon en el puerto 5000
EXPOSE 5000

# Inicia la aplicacion al iniciar al contenedor
CMD ["npm", "start"]
