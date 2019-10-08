#!/bin/sh

current_dir="/home/jza/test/frontend"

if [ -e "$current_dir" ];then
	cd "$current_dir"
else
    echo "error.. path error : need_backup_dir   new_dir"
    exit 1
fi

rm -rf  ./backend



#git pull
git pull origin dev --force
#git clone -b dev  git@192.168.8.61:qingpu/frontend.git

git log -1
git log -1 > gitver.txt

cd ../

rsync -avzP --log-file=/var/log/rsync_.log   --delete --exclude '.git'   --progress /home/jza/test/frontend  inesa@10.27.181.22:/home/inesa/jza

