#!/bin/bash
echo $(dirname $(readlink -f $0))
cd $(dirname $(readlink -f $0))

cp -a backend_websocket oldbackend_websocket
tar -xzf PK06_bestboxDB_backend_websocket_20190927_1127.tar.gz
cd backend_websocket/

if [ -d "storage" ];then
	rm -rf storage
fi

if [ -d "runtime" ];then
	rm -rf runtime
fi

rm -rf ./.env

if [ -d "../oldbackend_websocket/storage" ];then
	mv ../oldbackend_websocket/storage  ./ ;
else
	mkdir storage;
fi

if [ -d "../oldbackend_websocket/runtime" ];then
	mv ../oldbackend_websocket/runtime ./ ;
else
	mkdir runtime;
fi

mv ../oldbackend_websocket/.env ./.env

chown www-data:www-data -R ./
chmod -R 755 storage
chmod -R 755 runtime
