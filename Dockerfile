FROM ubuntu:latest
RUN apt-get -y update && apt-get install apache2 -y
WORKDIR /var/www/html
COPY index.html /var/www/html
CMD ["apache2ctl", "-D", "FOREGROUND"]
