#!/bin/bash

if [ -z $1 ]
	then
	echo 'Usage:    git version'
	echo './bestbox_main.sh 8a27fcf8969c5dceb3b2b2be67ebb100'		
	exit 1
fi

if [ $2 ]
  then
  echo 'Usage: too many parameter'
  echo './bestbox_main.sh 8a27fcf8969c5dceb3b2b2be67ebb100'      
  exit 1
fi

CURTIME=`date +%Y%m%d_%H%M`
export GIT_SSL_NO_VERIFY=1
rm -rf ./backend_internet
git clone -b dev https://192.168.8.61/pi05_bestbox3/backend_inernet.git  ./backend_internet
cd ./backend_internet

#git checkout  $1
ic_Ret=`git checkout  $1 2>&1 | grep 'error' | wc -l`
#echo ${ic_Ret}
if [ ${ic_Ret} -le 0 ]
	then
		echo 'checkout ok '
	else
		echo ${ic_Ret}:"There is an checkout error"
		exit 1
fi

sleep 1
git log -1 > gitver.txt
cp -p gitver.txt ./public/

rm -rf ./storage ./.git
rm -f .env.example;
rm -f .gitignore;
rm -f .gitattributes;
rm -f up-rewrite.conf;
rm -f public/.gitignore;
rm -f public/u.php;
rm -f public/up-rewrite.conf;


find ./ -type d -exec chmod 775 {} \;
find ./ -type f -exec chmod 644 {} \;
cd ..
tar -czf PK06_bestboxDB_backend_main_${CURTIME}.tar.gz backend_internet
md5sum PK06_bestboxDB_backend_main_${CURTIME}.tar.gz > md5_backend_${CURTIME}.txt

# when deploying
# tar -xzf PJ03_qingpu_backend_${CURTIME}.tar.gz
#chown root:root -R backend
#
#cd backend/public/
#ln -sf ../storage/app/public storage

