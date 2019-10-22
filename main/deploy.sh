 #!/bin/bash
if [ -z $1 ]
	then
	echo "./deploy.sh PK06_bestboxDB_backend_main_20190927_1443.tar.gz"
	exit 1
fi

echo $(dirname $(readlink -f $0))
cd $(dirname $(readlink -f $0))

if [ -d "./oldbackend_internet" ];then
   rm -rf ./oldbackend_internet
fi

cp -a backend_internet oldbackend_internet
tar -xzf $1
cd ./backend_internet                                          

if [ -d "./storage" ];then
rm -rf ./storage
fi

cp -p ../oldbackend_internet/.env  ./
cp -p ../oldbackend_internet/config/constants.php ./config/

if [ -d "../oldbackend_internet/storage" ];then
    cp -a ../oldbackend_internet/storage  ./
else
    mkdir storage
fi

rm -rf   ./public/storage

/usr/local/php/bin/php  artisan  storage:link

chown www-data:www-data -R ./
chmod -R 755 storage

if [ -d "${HOME}/oldbackend_internet" ];then
rm -rf ${HOME}/oldbackend_internet
fi

mv ../oldbackend_internet ${HOME}/
