# develop stage
FROM node:16.20.0 as develop-stage
WORKDIR /app
COPY package*.json ./
ENV VUE_APP_SERVER_URL=VUE_APP_SERVER_URL

RUN npm install

EXPOSE 8080

CMD ["npm", "run", "serve"]

COPY . .

FROM node:16.20.0 AS build-stage
# Set working directory
WORKDIR /app
#ENV VARIABLE
ENV VUE_APP_SERVER_URL=http://localhost:4000
# Copy all files from current directory to working dir in image
COPY . .
# install node modules and build assets
RUN yarn install && yarn build

# nginx state for serving content
FROM nginx:alpine AS production-stage
# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
# Copy static assets from builder stage
COPY --from=build-stage /app/dist .
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]