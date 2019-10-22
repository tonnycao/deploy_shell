#!/bin/bash

if [ -z $1 ];then
  echo "payment_deploy.sh PK06_bestboxDB_backend_payment_20190927_1503.tar.gz"
  exit 1
fi

echo $(dirname $(readlink -f $0))
cd $(dirname $(readlink -f $0))

if [ -d "oldweixin_payment" ];then
rm -rf oldweixin_payment;
fi

cp -a weixin_payment oldbackend_payment
tar -xzf $1

mv backend_payment weixin_payment
cd weixin_payment/

if [ -d "config" ];then
rm -rf config;
fi

if [ -d "tests" ];then
rm -rf tests;
fi

if [ -d "doc" ];then
rm -rf doc;
fi

cp -a ../oldweixin_payment/config  ./
chown www-data:www-data -R ./
chmod -R 750 config

if [ -d "${HOME}/oldweixin_payment" ];then
rm -rf ${HOME}/oldweixin_payment
fi

mv ../oldweixin_payment ${HOME}
