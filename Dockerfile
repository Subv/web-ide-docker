FROM php:7.0-apache
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN apt-get update && apt-get install -y gnupg
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y git nodejs build-essential python openssh-client mysql-client
USER www-data
RUN mkdir -p /opt/c9
RUN git clone https://github.com/exsilium/cloud9.git /opt/c9
RUN cd /opt/c9 && npm install
EXPOSE 3131
COPY run_server.sh /opt/run_server.sh
RUN chmod +x /opt/run_server.sh
USER root
CMD ["/opt/run_server.sh"]