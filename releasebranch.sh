#!bin/bash

WD=`pwd`

for dir in 'portal' 'texas'
do
  cd $WD/$dir
  if [ $dir = 'portal' ]
  then
    BR=$1
  else
    BR=$2
  fi
  echo `pwd`
  git fetch
  git br -D master
  git up -b master origin/master
  git up -b $BR
  git push origin -u $BR
done
cd $WD
