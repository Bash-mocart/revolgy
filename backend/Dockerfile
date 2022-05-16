FROM node:13.8.0 as build


# Create app directory
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY ./ .

RUN npm run build

FROM node:13.8.0-alpine

WORKDIR /app/node_modules/

COPY --from=build /app/node_modules/ .

WORKDIR /app/dist/

COPY --from=build /app/dist .

COPY --from=build /app/package*.json  ./

EXPOSE 3030

CMD [ "node", "main.js" ]