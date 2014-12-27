# run

docker run --name subversion -d -v /var/svn:/srv/subversion/data -v /etc/subversion:/srv/subversion/conf rkrx/subversion /bin/sh

