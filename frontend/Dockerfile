# FROM node:13.8.0 as build 

# ARG API_URL 

# WORKDIR /app

# COPY package*.json ./

# RUN npm install

# COPY ./ .

# ENV API_URL=${API_URL} 
# #   REACT_APP_API_KEY=${API_KEY} \ 
# RUN  npm run build:prod
  
FROM node:13.8.0-alpine

RUN npm install http-server -g

WORKDIR /app/dist

COPY ./dist /app/dist

EXPOSE 8080

CMD ["http-server"]