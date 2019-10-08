#!/bin/bash

if [ -z $1 ];then
   echo "websocket_deploy.sh PK06_bestboxDB_backend_websocket_20190927_1127.tar.gz"
	exit 1
fi

echo $(dirname $(readlink -f $0))
cd $(dirname $(readlink -f $0))

if [ -d "oldbackend_internet_websocket" ];then
	rm -rf oldbackend_internet_websocket
fi

mv backend_internet_websocket oldbackend_internet_websocket
if [ -d "backend_websocket" ];then
   rm -rf backend_websocket
fi

tar -xzf $1
mv backend_websocket backend_internet_websocket
cd ./backend_internet_websocket

if [ -d "storage" ];then
	rm -rf storage
fi

if [ -d "runtime" ];then
	rm -rf runtime
fi

rm -rf ./.env

if [ -d "../oldbackend_internet_websocket/storage" ];then
	cp -a ../oldbackend_internet_websocket/storage  ./ ;
else
	mkdir storage;
fi

if [ -d "../oldbackend_internet_websocket/runtime" ];then
	cp -a ../oldbackend_internet_websocket/runtime ./ ;
else
	mkdir runtime;
fi

mv ../oldbackend_internet_websocket/.env ./.env

chown www-data:www-data -R ./
chmod -R 755 storage
chmod -R 755 runtime
