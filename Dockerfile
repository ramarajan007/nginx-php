FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
# Install dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y wget curl && \
    add-apt-repository ppa:ondrej/php -y && \
    apt-get update -y && \
    apt-get install -y php && \
    echo '<?php phpinfo(); ?>' > /var/www/html/info.php

COPY phpmyadmin.conf /etc/apache2/conf-available/
    
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && \
    tar xvf phpMyAdmin-*-all-languages.tar.gz && \
    #rm phpMyAdmin-*-all-languages.tar.gz && \
    mv phpMyAdmin-5.2.1-all-languages /usr/share/phpmyadmin && \
    mkdir /usr/share/phpmyadmin/tmp && \
    chown -R www-data:www-data /usr/share/phpmyadmin && \
    chmod 777 /usr/share/phpmyadmin/tmp && \
    apt-get install -y php-{fpm,imap,ldap,xml,curl,imagick,mbstring,memcache,memcached,bcmath,bz2,intl,gd,mbstring,mysql,zip,common} && \
    a2enconf phpmyadmin
CMD ["apachectl", "-D", "FOREGROUND"]


    
    
    


