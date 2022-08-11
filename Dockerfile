# install node
FROM node:13-alpine  

#set env variables (optional)
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

#create parent directory
RUN mkdir -p /home/app

#copy current folder files to /home/app - Executes on the HOST machine
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

