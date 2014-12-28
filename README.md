# build

	docker build -t="rkrx/subversion" .

# run

	docker run --name subversion -d -p 80:80 -v /srv/subversion/data:/var/svn -v /srv/subversion/conf:/etc/svn rkrx/subversion

# cleanup

	docker kill subversion
	docker rm subversion
	docker rmi rkrx/subversion