#! /bin/sh

target=${1:-Japan-Tours};
path=`pwd`;
total=`cat ./data/${target}/*.data |wc -l`


for x in `cut -d',' -f3 ${path}/data/${target}/*.data`;
do
#   echo $x
    num=$(( $num + ${x}))
done



#echo ${num}/${total}
avg=`echo "scale=1; ${num}/${total}"| bc`;
echo ${target}:${total} offered avg:${avg}
