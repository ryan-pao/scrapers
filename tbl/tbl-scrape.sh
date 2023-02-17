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
lynx -dump https://www.toursbylocals.com/find_tour\&area=$code\&p=10|grep "Your Guide:"|sed "s/^.*Your Guide: /${location},'/g"|sed "s/ /\./g"|sed "s/$/'/g"  > $location.guide

paste -d',' ${location}.guide ${location}.final > ./data/${location}.data
sed -i "" "s/2days,/16,/g" ./data/${location}.data
sed -i "" "s/3days,/24,/g" ./data/${location}.data
sed -i "" "s/4days,/32,/g" ./data/${location}.data
sed -i "" "s/5days,/40,/g" ./data/${location}.data
sed -i "" "s/6days,/48,/g" ./data/${location}.data
sed -i "" "s/7days,/56,/g" ./data/${location}.data
sed -i "" "s/8days,/64,/g" ./data/${location}.data
sed -i "" "s/9days,/72,/g" ./data/${location}.data
sed -i "" "s/10days,/80,/g" ./data/${location}.data
sed -i "" "s/11days,/88,/g" ./data/${location}.data
sed -i "" "s/12days,/96,/g" ./data/${location}.data
sed -i "" "s/13days,/104,/g" ./data/${location}.data
sed -i "" "s/14days,/112,/g" ./data/${location}.data

rm -rf ${location}.guide ${location}.final ${location}.data



