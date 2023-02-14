#! /bin/sh
path=`pwd`


for guide in `cat ./data/*.data|cut -d',' -f2|sort|uniq`
    do

    cnt=`grep  -ls "$guide" ./data/*.data|wc -l`
    loc=`grep  -ls "$guide" ./data/*.data |tr -d '\n' |sed "s/\.\//:/g"|cut -d ':' -f2- |sed "s/\.data//g"|
    sed "s/data\///g"|sed "s/ /:/g"`
    echo "$guide",$cnt,$loc
    done
