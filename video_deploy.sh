#!/bin/bash
if [ -z $1 ];then
   echo "video_deploy.sh PK06_bestboxDB_backend_video_20190927_1637.tar.gz"
	exit 1
fi

echo $(dirname $(readlink -f $0))
cd $(dirname $(readlink -f $0))

if [ -d "oldbackend_video" ];then
  rm -rf oldbackend_video;
fi

cp -a backend_video oldbackend_video
tar -xzf PK06_bestboxDB_backend_video_20190927_1637.tar.gz
cd backend_video/

if [ -d "App" ];then
mv App app;
fi

if [ -d "config" ];then
  rm -rf ./config;
fi

if [ -d "storage" ];then
  rm -rf ./storage;
fi

cp -a ../oldbackend_video/config  ./

if [ -d "../oldbackend_video/storage" ];then
   cp -a ../oldbackend_video/storage ./
else
   mkdir storage
fi

chown www-data:www-data -R ./
chmod -R 755 config
chmod -R 755 storage
