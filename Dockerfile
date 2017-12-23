FROM node:latest

# Create app Dir
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

# Install App Dependencies
RUN apt-get update

RUN npm install 

# Bundle app source
COPY . .

EXPOSE 3010
