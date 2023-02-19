#! /bin/sh

path=`pwd`

rm -f ${path}/data/id.list

for x in `seq 1 10`
    do
    lynx -dump https://www.wowu.jp/tours\?kind=0\&page=$x|grep "tours/[[:digit:]].*?"|cut -d'/' -f5|cut -d'?' -f1 |sort|uniq >> ${path}/data/id.list
done


#for tour in `head -n 5 ${path}/data/id.list`
for tour in `cat ${path}/data/id.list`
    do
        lynx -dump https://www.wowu.jp/tours/${tour}\?locale=en  > ${path}/data/temporary/${tour}.raw
        f=`grep -n "^Details" ${path}/data/temporary/${tour}.raw | cut -d':' -f1`
        t=`grep -n "^Select Date" ${path}/data/temporary/${tour}.raw | cut -d':' -f1`
        cat ${path}/data/temporary/${tour}.raw | sed -n "${f},${t}p" > ${path}/data/$tour.data
echo $tour rendered
    done

rm -rf ${path}/data/temporary/*

