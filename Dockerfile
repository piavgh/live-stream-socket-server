FROM node:lts-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Install ffmpeg and dependencies
RUN apk add  --no-cache ffmpeg && npm install --production

# Bundle app source
COPY . .

EXPOSE 8080

CMD [ "node", "server.js" ]
