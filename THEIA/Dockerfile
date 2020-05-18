FROM openjdk:8-jdk-alpine

# Indexing API configuration parameters
ENV CLAMP_RUN 1
ENV CLAMP_JAVA_OPTS "-Xmx8g"
ENV METAMAP_RUN 1
ENV METAMAP_JAVA_OPTS "-Xmx8g"
ENV CTAKES_RUN 1
ENV CTAKES_JAVA_OPTS "-Xmx8g"
ENV UMLS_USER ""
ENV UMLS_PASS ""

# Install packages & apply configurations
RUN apk update && \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils \
                       apache2 curl \
                       php7 php7-apache2 php7-bz2 php7-calendar \
                       php7-ctype php7-curl php7-dom php7-exif \
                       php7-fileinfo php7-ftp php7-gd php7-gettext \
                       php7-gmp php7-iconv php7-json php7-mysqli \
                       php7-mysqlnd php7-openssl php7-pcntl \
                       php7-pdo php7-pdo_dblib php7-pdo_mysql \
                       php7-pdo_sqlite php7-phar php7-posix \
                       php7-session php7-shmop php7-simplexml \
                       php7-sockets php7-sqlite3 php7-sysvmsg \
                       php7-sysvsem php7-sysvshm php7-tokenizer \
                       php7-wddx php7-xml php7-xmlreader \
                       php7-xmlwriter php7-xsl php7-zip php7-zlib && \
    addgroup mysql mysql && \
    mkdir /scripts && \
    rm -rf /var/cache/apk/* && \
    rm /var/www/localhost/htdocs/index.html && \
    sed -i 's/^skip-networking/#skip-networking/g; s/^#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i 's/^max_input_time = 60/max_input_time = 300/g; s/^max_execution_time = 30/max_execution_time = 300/g; s/^upload_max_filesize = 2M/upload_max_filesize = 2G/g; s/^post_max_size = 8M/post_max_size = 2G/g; s/^memory_limit = 128M/memory_limit = 3G/g;' /etc/php7/php.ini
 
# Expose frontend application
EXPOSE 80

# Copy resources into container
COPY data/umls /usr/lib/terminologies/umls
COPY data/dump.sql /data/dump.sql
COPY api/. /app/api/.
COPY frontend/theia-interface/. /var/www/localhost/htdocs
COPY scripts/start.sh /scripts/start.sh
RUN chmod +x /scripts/start.sh && \
    chown apache /var/www/localhost/htdocs/pipelinefiles

CMD ["-D","FOREGROUND"]

ENTRYPOINT [ "/scripts/start.sh" ]