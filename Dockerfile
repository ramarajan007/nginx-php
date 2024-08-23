FROM nginx:latest
RUN apt-get update 
RUN apt-get install ca-certificates apt-transport-https software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get install php8.3 -y 
RUN apt-get install -y php8.3-{fpm,imap,ldap,xml,curl,imagick,mbstring,memcache,memcached,bcmath,bz2,intl,gd,mbstring,mysql,zip,common}
COPY info.php /var/www/html/
COPY nginx-php.conf /etc/nginx/conf.d/default
EXPOSE 80 
CMD ["nginx", "-g", "daemon off;"]



