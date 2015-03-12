# build

	docker build -t="rkrx/subversion" .

# run

	docker run --name subversion -d -p 80:80 -v /srv/subversion/data:/var/svn -v /srv/subversion/conf:/etc/svn rkrx/subversion

# cleanup

	docker kill subversion
	docker rm subversion
	docker rmi rkrx/subversion
	
# Configuration
	AuthUserFile: /srv/subversion/conf/svn-passwd -> /etc/svn/svn-passwd
	* https://www.csoft.net/docs/htaccess.html
	AuthzSVNAccessFile: /srv/subversion/conf/svn-access -> /etc/svn/svn-access
	* http://serverfault.com/questions/159247/how-does-authzsvnaccessfile-work
