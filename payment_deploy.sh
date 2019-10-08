#!/bin/bash


echo $(dirname $(readlink -f $0))
cd $(dirname $(readlink -f $0))

if [ -d "oldbackend_payment" ];then
rm -rf oldbackend_payment;
fi

cp -a backend_payment oldbackend_payment
tar -xzf PK06_bestboxDB_backend_payment_20190927_1503.tar.gz
cd backend_payment/

if [ -d "config" ];then
rm -rf config;
fi

if [ -d "tests" ];then
rm -rf tests;
fi

if [ -d "doc" ];then
rm -rf doc;
fi

mv ../oldbackend_payment/config  ./
chown www-data:www-data -R ./
chmod -R 750 config
