#! /bin/sh

path=`pwd`;
dest=${1:-Japan-Tours}
mkdir ../../data/${dest}

#https://www.toursbylocals.com/Japan-Tours

lynx -source https://www.toursbylocals.com/${dest} |grep area= > ${path}/${dest}.raw

  grep -o 'area=[[:digit:]].*\"' ${path}/${dest}.raw|cut -d'=' -f2|tr -d '"' > ${path}/code.list
  cut -d ' ' -f7 ${path}/${dest}.raw > ${path}/cities.list
  paste -d':' ${path}/cities.list ${path}/code.list > ${path}/../${dest}.list
  rm -rf ${path}/${dest}.raw


