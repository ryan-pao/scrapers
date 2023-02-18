#! /bin/sh

path=`pwd`
list=${1:-japan}


for guide in `cat ./data/${list}/*.data|cut -d',' -f2|sort|uniq`
    do
#        echo $guide

        cnt=`grep  -ls "$guide" ./data/${list}/*.data|wc -l|tr -d ' '`
        loc=`grep  -ls "$guide" ./data/${list}/*.data | tr -d '\n' |sed "s/\.\//,/g"|cut -d ':' -f2- |sed "s/${list}\///g"| sed "s/\.data//g"| sed "s/data\///g"|sed "s/ /:/g"`
        #echo $loc|sed "s/^,//g"
        spot=`echo $loc|sed "s/^,//g"`

        echo "$guide",$cnt,$spot

    done
