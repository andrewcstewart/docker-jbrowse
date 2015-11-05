# Using the official image repository
FROM httpd:2.4
MAINTAINER Andrew Stewart, andrew.c.stewart@gmail.com

# Fetch prerequisites
RUN apt-get update -y --fix-missing
RUN apt-get install -y build-essential libpng-dev zlib1g-dev libgd2-xpm-dev curl unzip

# Download jbrowse
WORKDIR /
RUN curl -O http://jbrowse.org/releases/JBrowse-1.11.6.zip
RUN unzip JBrowse-1.11.6.zip && rm JBrowse-1.11.6.zip
# Clean dir name? :-)
RUN mv JBrowse-1.11.6 jbrowse 
WORKDIR /jbrowse

# Install jbrowse
RUN ./setup.sh
# Create softlink for /usr/local/apache2/htdocs as /jbrowse/
RUN rm -rf /usr/local/apache2/htdocs && ln -s /jbrowse/ /usr/local/apache2/htdocs