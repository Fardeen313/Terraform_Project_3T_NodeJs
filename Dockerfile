FROM ubuntu:latest

# Set working directory
WORKDIR /frontapp

# Copy client files
COPY client /frontapp/

# Update package lists and install dependencies
RUN apt-get update -y && \
    apt-get install -y curl build-essential ca-certificates git unzip python3 make gcc g++ 

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install Serve globally (no PM2 or Corepack)
RUN npm install -g serve

# Install project dependencies and build
RUN npm install && \
    npm run build

# Expose port 90 for the frontend
EXPOSE 90

# Start the frontend server interactively using Serve (no PM2)
CMD ["serve", "-s", "build", "-l", "90"]
