FROM node:lts-alpine AS build

WORKDIR usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000
CMD ["node", "server.js"]