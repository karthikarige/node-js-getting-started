FROM node:12.14.0

RUN apt-get update
RUN apt-get install -y libav-tools
RUN apt-get install -y imagemagick ghostscript poppler-utils
RUN apt-get install -y parallel
RUN apt-get install -y graphicsmagick

# do i need this.. seems the build says it has it..
## for now ignoring the warning...!!!
#RUN apt-get install -y ffmpeg

# Create app directory
WORKDIR /app/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json ./

RUN npm set progress=false && npm config set depth 0 && npm cache clean --force


RUN npm install


# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
COPY . .

EXPOSE 5000
CMD [ "npm", "start" ]
