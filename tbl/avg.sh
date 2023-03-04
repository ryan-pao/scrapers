#! /bin/sh



#Japan-Tours: 898 offered avg:372.5

target=${1:-Japan};
target=${target}-Tours
path=`pwd`;
total=`cat ./data/${target}/*.data |wc -l`


# AVERAGE PRICE
for x in `cut -d',' -f3 ${path}/data/${target}/*.data`;
do
#   echo $x
    price=$(($price + ${x}))
done




avgPrice=`echo "scale=2; ${price}/${total}"| bc`;

uniqGuides=`cut -d',' -f2 ${path}/data/${target}/*.data |sort |uniq |wc -l`

echo ${target}:${total} services avg:$ ${avgPrice} guides:${uniqGuides} people 

# GUIDES

