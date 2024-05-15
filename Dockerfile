# verion Node.js
FROM node:latest

# répertoire de travail
WORKDIR /usr/src/app

# copie des fichiers package.json et package-lock.json
COPY package*.json ./

# dépendances Node.js
RUN npm install

# copie du code de l'application
COPY . .

# construction de l'application
RUN npm run build

# exposition du port(port react)
EXPOSE 3000

# démarrer l'application
CMD ["npm", "start"]

