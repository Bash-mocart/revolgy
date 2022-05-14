FROM node:13.8.0 as build 

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY ./ .

RUN  npm run build:prod
  
FROM node:13.8.0-alpine

RUN npm install http-server -g

WORKDIR /app/dist/

COPY --from=build /app/dist .

EXPOSE 8080

CMD ["http-server"]