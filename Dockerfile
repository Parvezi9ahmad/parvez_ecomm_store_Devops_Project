# Build stage
FROM node:16 AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build --prod

# Runtime stage
FROM nginx:alpine

COPY --from=build /app/dist/ecommerce_frontend /usr/share/nginx/html

EXPOSE 80

