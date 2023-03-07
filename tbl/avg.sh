#! /bin/sh



#Japan-Tours: 898 offered avg:372.5

target=${1:-Japan};
target=${target}-Tours
path=`pwd`;
total=`cat ./data/${target}/*.data |wc -l`
locations=`ls -1 ./data/${target} | wc -l`;


# AVERAGE PRICE
for x in `cut -d',' -f3 ${path}/data/${target}/*.data`;
do
#   echo $x
    price=$(($price + ${x}))
done




avgPrice=`echo "scale=2; ${price}/${total}"| bc`;
uniqGuides=`cut -d',' -f2 ${path}/data/${target}/*.data |sort |uniq |wc -l`
perGuide=`echo "scale=2; ${total}/${uniqGuides}"|bc`;



echo ${target}:${total}:locations:${locations} services avg:$ ${avgPrice} guides:${uniqGuides}  avg offer ${perGuide}

# GUIDES

