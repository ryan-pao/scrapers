#! /bin/sh

export LANG=C


path=`pwd`;
list=${1:-Japan-Tours}
mkdir ${path}/data/${list}


lynx -source https://www.toursbylocals.com/${list} |grep area= > ${path}/destinations/${list}.raw

  grep -o 'area=[[:digit:]].*\"' ${path}/destinations/${list}.raw|cut -d'=' -f2|tr -d '"' > ${path}/destinations/code.list
  cut -d '>' -f4 ${path}/destinations/${list}.raw |cut -d'.' -f1|rev|cut -d' ' -f2|rev > ${path}/destinations/cities.list
#cut -d'>' -f4 South-Korea-Tours.raw |cut -d'.' -f1|rev|cut -d' ' -f2|rev

  paste -d':' ${path}/destinations/cities.list ${path}/destinations/code.list > ${path}/destinations/${list}.list
  rm -rf ${path}/destinations/${list}.raw



for c in `cat ./destinations/${list}.list`;
do

    location=`echo $c|cut -d':' -f1`;
    code=`echo $c|cut -d':' -f2`;




echo rendering:$location

# sed "s/^/${location}, /" |

# [733]For up to

#echo  "${location},\\r\\n" > ${location}.data
echo  "" > ./data/${list}/${location}.data

lynx -dump https://www.toursbylocals.com/find_tour\&area=$code\&p=10|grep -A2 "USD per tour"| 
iconv -f utf8 -t ascii//TRANSLIT//IGNORE |
sed "s/,//g" |
sed "s/USD per tour/,/g" |tr -d '$' |
sed "s/\[.*\]For up to//g" | sed "s/ people/,/g"|sed "s/limit//g"|sed "s/person//g"|

sed "s/ //g" |sed "s/\\r//g" |
sed "s/,/&/g"|
sed "s/--//g" |
sed "s/hour.*$/&,----/g" |sed "s/hour.//g"|sed "s/30min./\.5/g"|sed "s/10min.//g"|

sed "s/days$/&,----/g" |
sed '/^$/d' > ./data/${list}/$location.data

cat ./data/${list}/${location}.data |sed '/^$/d'|tr -d '\n' | sed "s/----/\r\n/g"  > ./data/${list}/$location.final
#lynx -dump https://www.toursbylocals.com/find_tour\&area=$code\&p=10 > ${location}.raw
lynx -dump https://www.toursbylocals.com/find_tour\&area=$code\&p=10|iconv -f utf8 -t ascii//TRANSLIT//IGNORE |grep "Your Guide:"|sed "s/^.*Your Guide: /${location},'/g"|sed "s/ /\./g"|sed "s/$/'/g"  > ./data/${list}/$location.guide

paste -d',' ./data/${list}/${location}.guide ./data/${list}/${location}.final > ./data/${list}/${location}.data
sed -i "" "s/2days,/16,/g" ./data/${list}/${location}.data
sed -i "" "s/3days,/24,/g" ./data/${list}/${location}.data
sed -i "" "s/4days,/32,/g" ./data/${list}/${location}.data
sed -i "" "s/5days,/40,/g" ./data/${list}/${location}.data
sed -i "" "s/6days,/48,/g" ./data/${list}/${location}.data
sed -i "" "s/7days,/56,/g" ./data/${list}/${location}.data
sed -i "" "s/8days,/64,/g" ./data/${list}/${location}.data
sed -i "" "s/9days,/72,/g" ./data/${list}/${location}.data
sed -i "" "s/10days,/80,/g" ./data/${list}/${location}.data
sed -i "" "s/11days,/88,/g" ./data/${list}/${location}.data
sed -i "" "s/12days,/96,/g" ./data/${list}/${location}.data
sed -i "" "s/13days,/104,/g" ./data/${list}/${location}.data
sed -i "" "s/14days,/112,/g" ./data/${list}/${location}.data


    for r in `grep -o ",[[:digit:]].*-[[:digit:]].*," ./data/${list}/${location}.data |cut -d',' -f2`;
        do

        x=`echo ${r}|cut -d'-' -f1`
        y=`echo ${r}|cut -d'-' -f2`
#    z=$((${x}+${y}))
        z=`echo  "scale=0; (${x}+${y})/2"|bc`

    sed -i "" "s/${r}/${z}/g" ./data/${list}/${location}.data
    done



rm -rf ./data/${list}/${location}.guide ./data/${list}/${location}.final ${location}.data


done
