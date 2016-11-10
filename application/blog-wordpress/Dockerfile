FROM wordpress:latest


# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY ./themes/jra-blog-simple-theme-1 /var/www/html/wp-content/themes

EXPOSE 8080
CMD [ "node", "app.js" ]
