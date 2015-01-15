FROM ubuntu:12.04
MAINTAINER Andrew Stewart, andrew.c.stewart@gmail.com

# Fetch prerequisites
RUN apt-get update
RUN apt-get install -y build-essential libpng-dev zlib1g-dev libgd2-xpm-dev wget unzip

# Install apache
RUN apt-get install -y apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Download jbrowse
WORKDIR /var/www
RUN wget -O JBrowse-1.11.5.zip http://jbrowse.org/wordpress/wp-content/plugins/download-monitor/download.php?id=98
RUN unzip /var/www/JBrowse-1.11.5.zip
WORKDIR /var/www/JBrowse-1.11.5

# Install jbrowse
RUN ./setup.sh

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2"]
# ENTRYPOINT ["service apache2 start"]
CMD ["-D", "FOREGROUND"]
