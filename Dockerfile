FROM ubuntu:14.04

RUN echo "1.565.1" > .lts-version-number

RUN apt-get update && apt-get install -y wget git curl zip vim
RUN apt-get update && apt-get install -y apache2 subversion libapache2-svn

RUN usermod -U www-data && chsh -s /bin/bash www-data

#RUN echo 'ServerName ${ENV:SERVER_NAME}' >> /etc/apache2/conf-enabled/servername.conf

RUN mkdir /etc/subversion
RUN touch /etc/subversion/svn-access
RUN touch /etc/subversion/svn-passwd
COPY dav_svn /etc/apache2/mods-available
#COPY enable-var-www-html-htaccess.conf /etc/apache2/conf-enabled/
#COPY run_apache.sh /var/www/
RUN a2enmod rewrite cgi headers dav_svn

#volume "/var/log"

RUN mkdir -p /var/svn

#VOLUME ["/var/www/html", "/var/log/apache2", "/var/svn" ]

ENV SERVERNAME "docker-subversion"

# for main web interface:
EXPOSE 80

#USER www-data

WORKDIR /var/svn

#CMD ["/var/www/run_apache.sh"]