#!/bin/sh
name=$ROUTE_HOST
#PORT=9083
level2="`echo "$name"|cut -d. -f1`"
domain="`echo "$name"|cut -d. -f2,3`"
#echo $domain
FS=$'\n'
res="/go/bin/cli53 rrcreate --replace $domain"
cur_ip=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`
nc -z -v -w5 $cur_ip $PORT
if [ $? -eq 0 ]; then
res="$res '$level2 60 A $cur_ip'"
fi
for item in $(nslookup $name | grep Address | awk '{ print $3 }')
do
nc -z  -w5 $item $PORT
if [ $? -eq 0 ] && [ "$cur_ip" != "$item" ]; then
    res="$res '$level2 60 A $item'"
fi
done
#echo $res
eval "$res"
