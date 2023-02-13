#! /bin/sh

location=${1:-kyoto}
code=${2:-610}



echo location:$location

# sed "s/^/${location}, /" |

# [733]For up to

#echo  "${location},\\r\\n" > ${location}.data
echo  "" > ${location}.data

lynx -dump https://www.toursbylocals.com/find_tour\&area=$code\&p=10|grep -A2 "USD per tour"| 
sed "s/,//g" |
sed "s/USD per tour/,/g" |tr -d '$' |
sed "s/\[.*\]For up to//g" | sed "s/ people/,/g"|sed "s/limit//g"|sed "s/person//g"|

sed "s/ //g" |sed "s/\\r//g" |
sed "s/,/&/g"|
sed "s/--//g" |
sed "s/hour.*$/&,----/g" |sed "s/hour.//g"|sed "s/30min./\.5/g"|sed "s/10min./\.00xx/g"|

sed "s/days$/&,----/g" |
sed '/^$/d' > $location.data

cat ${location}.data |sed '/^$/d'|tr -d '\n' | sed "s/----/\r\n/g"  >$location.final
#lynx -dump https://www.toursbylocals.com/find_tour\&area=$code\&p=10 > ${location}.raw
lynx -dump https://www.toursbylocals.com/find_tour\&area=$code\&p=10|grep "Your Guide:"|sed "s/^.*Your Guide: /${location},/g"  > $location.guide

paste -d',' ${location}.guide ${location}.final > ${location}.data
sed -i "" "s/2days,/16,/g" ${location}.data
sed -i "" "s/3days,/24,/g" ${location}.data
sed -i "" "s/4days,/32,/g" ${location}.data
sed -i "" "s/5days,/40,/g" ${location}.data

rm -rf ${location}.guide ${location}.final


