FROM node:12.16.1-alpine As builder

WORKDIR /yoni/client/src/app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build --prod

FROM nginx:1.15.8-alpine

COPY --from=builder /yoni/client/src/app/dist/lecoincoin/ /usr/share/nginx/html
