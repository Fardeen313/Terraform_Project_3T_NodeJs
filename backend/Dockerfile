# Stage 1: Build the application
FROM node:18 AS build
# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the working directory
COPY package.json package-lock.json ./

# Install application dependencies
RUN npm install
RUN npm install dotenv
# Install pm2 globally
RUN npm install -g pm2 


# Copy the rest of the application code to the working directory
COPY . .

# Expose port 80 to the outside world
EXPOSE 3000
EXPOSE 80
RUN apt update && apt install -y default-mysql-client

# Command to start the application with pm2
#CMD ["pm2-runtime", "index.js", "--name", "backendapi"]
CMD ["pm2-runtime", "start", "index.js", "--name", "backendapi"]
