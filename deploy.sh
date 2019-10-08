cd /home/jza/test/bsb/backend/main/
cp -a backend_internet oldbackend_internet
tar -xzf PK06_bestboxDB_backend_main_20190926_1657.tar.gz
cd backend_internet/                                          

if [ -d "storage" ];then
rm -rf storage
fi

cp -p ../oldbackend_internet/.env  ./
mv ../oldbackend_internet/storage  ./
chown www-data:www-data -R ./
chmod -R 755 storage

