# We need HHVM
FROM jolicode/hhvm
# We need nginx
RUN sudo apt-get update 

 && sudo apt-get install -y nginx


ADD . /root
RUN sudo chmod +x /root/start.sh


# Nginx configuration
ADD hhvm.hdf /etc/hhvm/server.hdf
ADD nginx.conf /etc/nginx/sites-available/hack.conf
RUN sudo ln -s /etc/nginx/sites-available/hack.conf /etc/nginx/sites-enabled/hack.conf
# Checking nginx config
RUN sudo nginx -t


RUN sudo chown -R www-data:www-data /root
WORKDIR /root


# The app needs to listen on port 8080
EXPOSE 8080


# Launch the start script
CMD ["sudo","/root/start.sh"]
