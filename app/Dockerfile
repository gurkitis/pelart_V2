FROM node:12.16.1 as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install -g @angular/cli@11.0.5
COPY . ./
RUN ng build app

FROM nginx:latest
COPY --from=builder /app/dist/app /usr/share/nginx/html
EXPOSE 80/tcp