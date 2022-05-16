FROM node:13.8.0 as build 

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY ./ .

RUN  npm run build:prod
  
FROM nginx:alpine

WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
# Copy static assets from builder stage
COPY --from=build /app/dist .

EXPOSE 80
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]