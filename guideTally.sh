#! /bin/sh
path=`pwd`
#loc=${1:-kyoto}

echo location, service, guides
for loc in `ls -1 ${path}/data/|cut -d'.' -f1`
do
    guidecount=`cat ${path}/data/${loc}.data |cut -d',' -f1-2  |sort |uniq |wc -l`
    servicecount=`cat ${path}/data/${loc}.data |cut -d',' -f1-2  |sort |wc -l`
    echo ${loc},${servicecount},${guidecount}
done





