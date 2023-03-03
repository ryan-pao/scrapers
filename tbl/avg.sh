#! /bin/sh

raw=${1}
echo raw ${raw}
uno=`echo ${raw}| cut -d'-' -f1`
dos=`echo ${raw}| cut -d'-' -f2`
echo  "scale=0; ($uno+$dos)/2"|bc
echo  "scale=0; ($uno+$dos)/2"|bc |tr -cd '[:print:]'|pbcopy

