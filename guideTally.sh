#! /bin/sh
path=`pwd`
list=${1:-overseas}


echo location, service, guides
for loc in `ls -1 ${path}/data/${list}/|cut -d'.' -f1`
do
    guidecount=`cat ${path}/data/${list}/${loc}.data |cut -d',' -f1-2  |sort |uniq |wc -l`
    servicecount=`cat ${path}/data/${list}/${loc}.data |cut -d',' -f1-2  |sort |wc -l`
    echo ${loc},${servicecount},${guidecount}
done





