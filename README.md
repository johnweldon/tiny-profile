# tiny-profile

## get started

	git init
	git remote add origin git://github.com/johnweldon/tiny-profile
	git fetch
	git checkout -t origin/master -f
	git submodule update --init --recursive

*Important, if you're using public key to connect via ssh*

Note that the default repo has my public key, replace it with yours, 
unless you do intend to grant me ssh access to your host.

	chmod 700 .ssh
	chmod 600 .ssh/config
	chmod 600 .ssh/authorized_keys


## quickstart

Don't do this unless you've read the script, and approve what it's doing:

`bash <(curl -s https://github.com/johnweldon/tiny-profile/blob/master/tiny-profile-init.sh)`
