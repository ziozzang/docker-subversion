FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y apache2 subversion libapache2-svn

RUN usermod -U www-data && chsh -s /bin/bash www-data
#RUN echo 'ServerName ${ENV:SERVERNAME}' >> /etc/apache2/conf-enabled/servername.conf

RUN rm /etc/apache2/mods-available/dav_svn.conf
COPY dav_svn.conf /etc/apache2/mods-available/dav_svn.conf
RUN a2enmod rewrite cgid headers dav_svn
RUN a2dissite 000-default

RUN mkdir -p /etc/svn
RUN mkdir -p /var/svn
RUN ls -la /var/log/apache2

#ENV SERVERNAME "docker-subversion"

EXPOSE 80

#USER www-data
#WORKDIR /var/svn

ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD /etc/init.d/apache2 start && /bin/bash
