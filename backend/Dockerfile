FROM node:13.8.0 as build


# Create app directory
WORKDIR /app


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)

COPY package*.json ./

RUN npm install

COPY ./ .

RUN npm run build

# ARG NODE_ENV=production
# ARG VERSION=1
# ARG TYPEORM_CONNECTION=postgres
# ARG TYPEORM_MIGRATIONS_DIR=./migrations
# ARG TYPEORM_ENTITIES=./modules/domain/**/*.entity{ .ts,.js}
# ARG TYPEORM_MIGRATIONS=./migrations/*.ts

# # Things you can change if you wish...
# ARG TYPEORM_HOST=database-1.cef033x9wxsq.us-east-1.rds.amazonaws.com
# ARG TYPEORM_PORT=5432
# ARG TYPEORM_USERNAME=postgres
# ARG TYPEORM_PASSWORD=u15ch1136
# ARG TYPEORM_DATABASE=postgres



FROM node:13.8.0-alpine

WORKDIR /app/node_modules/

COPY --from=build /app/node_modules/ .

WORKDIR /app/dist/

COPY --from=build /app/dist .

COPY --from=build /app/package*.json  ./



EXPOSE 3030

CMD [ "node", "main.js" ]