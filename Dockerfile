FROM php:7.0-apache
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN apt-get update && apt-get install -y gnupg
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y git nodejs build-essential python openssh-client
RUN mkdir -p /opt/c9
RUN git clone https://github.com/exsilium/cloud9.git /opt/c9
RUN cd /opt/c9 && npm install
EXPOSE 3131
CMD ["/opt/c9/bin/cloud9.sh", "-l", "0.0.0.0", "-p", "3131", "-w", "/var/www/html/"]