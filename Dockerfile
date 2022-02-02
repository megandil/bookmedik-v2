FROM php:7.4-apache
RUN docker-php-ext-install mysqli && apt-get update && apt-get install -y mariadb-client && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY bookmedik /var/www/html/
ENV BK_USER=mysql
ENV BK_PASS=mysql
ENV BK_HOST=mariadb
ENV BK_BD=bookmedik
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
EXPOSE 80
CMD ["bash", "docker-entrypoint.sh"]