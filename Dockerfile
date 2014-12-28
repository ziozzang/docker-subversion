FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y apache2 subversion libapache2-svn

RUN usermod -U www-data && chsh -s /bin/bash www-data

#RUN echo 'ServerName ${ENV:SERVER_NAME}' >> /etc/apache2/conf-enabled/servername.conf

RUN rm /etc/apache2/mods-available/dav_svn.conf
COPY dav_svn.conf /etc/apache2/mods-available/dav_svn.conf
RUN a2enmod rewrite cgid headers dav_svn
RUN a2dissite 000-default

#RUN cat /etc/apache2/mods-available/dav_svn.conf
#COPY enable-var-www-html-htaccess.conf /etc/apache2/conf-enabled/
#COPY run_apache.sh /var/www/

#volume "/var/log"

RUN mkdir -p /var/svn && cd /var/svn && svnadmin create repos

#VOLUME ["/var/www/html", "/var/log/apache2", "/var/svn" ]

ENV SERVERNAME "docker-subversion"

# for main web interface:
EXPOSE 80

#USER www-data

#WORKDIR /var/svn

ADD run.sh /run.sh
CMD ["/run.sh"]