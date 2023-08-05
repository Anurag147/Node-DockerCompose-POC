#Use a base image, which here is node and version is alpine
FROM node:alpine

#When the files are moved to docker container move them in app folder
WORKDIR '/app'

#First copy package.json to our container and then run npm install
#This is done so that npm install runs only when package.json is updated else pull node modules from cache
COPY package.json .
RUN npm install

#Copy all other JS files to docker image
COPY . .

#Command to start the node docker image
CMD ["npm", "start"]