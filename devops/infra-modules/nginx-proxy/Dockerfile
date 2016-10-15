FROM ubuntu:14.04

# install nginx
RUN sudo apt-get update  &&
    sudo apt-get install -y nginx  



# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080
#CMD [ "bash" ]
