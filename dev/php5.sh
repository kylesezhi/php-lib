
# php5.5 安装

	cd ~/
	wget http://cn2.php.net/distributions/php-5.5.30.tar.gz -O - | tar xzvf -
	cd php-5.5.30/
	sudo yum install libxml2 libxml2-devel mysql mysql-devel -y
	sudo yum install curl-devel db4-devel libjpeg-devel libpng-devel libXpm-devel gmp-devel libc-client-devel openldap-devel unixODBC-devel postgresql-devel sqlite-devel aspell-devel net-snmp-devel libxslt-devel libxml2-devel pcre-devel mysql-devel unixODBC-devel postgresql-devel pspell-devel net-snmp-devel libxslt-devel -y
	sudo yum install libmcrypt libmcrypt-devel -y
	sudo yum install  bzip2  bzip2-devel -y
	./configure --enable-fpm --with-mysql --with-mysqli=`which mysql_config` --with-curl=ext/curl --with-bz2=ext/bz2 --with-openssl --with-mcrypt=ext/mcrypt --with-mhash --enable-mbstring --with-ldap --with-gd --with-jpeg-dir=/usr/lib64 --enable-bcmath --enable-pcntl --enable-shmop --with-pdo-mysql --enable-soap --enable-sockets --enable-sysvsem --enable-sysvmsg --enable-zip --with-zlib
	make && sudo make install

	cp php.ini-development /usr/local/lib/php.ini
	ln -s /usr/local/lib/php.ini /etc
	#	pdo_mysql.default_socket= /tmp/mysql.sock
	#	date.timezone = Asia/Chongqing

	cp /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf
	ln -s /usr/local/etc/php-fpm.conf /etc
	#cp sapi/fpm/php-fpm /usr/local/bin


## ldap
php 编译时会去`/usr/lib` 下找 ldap 库, 对于centos 64bit 来说，需要copy 一下

	cp -frp /usr/lib64/libldap* /usr/lib/

## gd jpeg support
安装gd 时，需要特别指定jpeg 需要的libjpeg 库，可以通过以下命令查找到此库

	 find / -name libjpeg*

Then specify jpeg lib dir

	--with-gd --with-jpeg-dir=/usr/lib64

> You need to do `make clean` before recompile gd

# pdo
## sudo yum install php-pdo php-mysql -y
