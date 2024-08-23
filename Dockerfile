FROM nginx:latest
RUN apt-get install ca-certificates apt-transport-https software-properties-common -y && \
    add-apt-repository ppa:ondrej/php -y && \
    apt-get install php8.3 -y && \
    apt-get install -y php8.3-{fpm,imap,ldap,xml,curl,imagick,mbstring,memcache,memcached,bcmath,bz2,intl,gd,mbstring,mysql,zip,common}
COPY info.php /var/www/html/
COPY nginx-php /etc/nginx/conf.d/default



