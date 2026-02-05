# --- Stage 1: Build ---
FROM node:20-alpine AS build
WORKDIR /app

# 1. Change this: Copy from the current directory
COPY package*.json ./
RUN npm install

# 2. Change this: Copy everything from the current directory
COPY . .
RUN npm run build

# --- Stage 2: Serve ---
FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*

# Copy from the build stage
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]