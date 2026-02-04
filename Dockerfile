FROM node:20-alpine

WORKDIR /app

# Copy package files first to leverage Docker cache
COPY package*.json ./
RUN npm install

# Copy the rest of the code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Using --host 0.0.0.0 is crucial for reaching the app from localhost
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]