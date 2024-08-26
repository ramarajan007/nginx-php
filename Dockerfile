FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
# Install dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php -y && \
    apt-get update && \
    apt-get install -y php && \
    apt-get install -y php8.3-{fpm,imap,ldap,xml,curl,imagick,mbstring,memcache,memcached,bcmath,bz2,intl,gd,mbstring,mysql,zip,common} && \
    echo '<?php phpinfo(); ?>' > /var/www/html/info.php
    
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && \
    tar xvf phpMyAdmin-*-all-languages.tar.gz && \
    mv phpMyAdmin-5.2.1-all-languages /usr/share/phpmyadmin && \
    mkdir /usr/share/phpmyadmin/tmp && \
    chown -R www-data:www-data /usr/share/phpmyadmin && \
    chmod 777 /usr/share/phpmyadmin/tmp && \
    
    
    


