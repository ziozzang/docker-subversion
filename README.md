# run

docker run --name subversion -d -p 80:80 -v /var/svn:/srv/subversion/data -v /etc/subversion:/srv/subversion/conf rkrx/subversion


