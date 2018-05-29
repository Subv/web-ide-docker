#!/bin/bash
docker-php-entrypoint apache2-foreground &
sudo -u www-data /opt/c9/bin/cloud9.sh -l 0.0.0.0 -p 3131 -w /var/www/html/