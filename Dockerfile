FROM node:14.9.0-alpine3.12 as builder

WORKDIR "/app"

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.19.2-alpine

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html
