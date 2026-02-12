# --- Stage 1: Build ---
FROM node:20-alpine AS build
WORKDIR /app

# 1. Change this: Copy from the current directory
COPY package*.json ./
RUN npm install


COPY . .
RUN npm run build

# --- Stage 2: Serve ---
FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*


COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
