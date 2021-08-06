#!/bin/bash
read N
declare -a mas
for(( i=0;i<N;i++ ))
do
	read t
	mas[i]=$t
done
reg_ipv4='^(((0|[1-9][0-9]|1([0-9]){0,2}|2([0-4][0-9]|5[0-5])|[1-9])\.){3}(0|[1-9][0-9]|1([0-9]){0,2}|2([0-4][0-9]|5[0-5])|[1-9]))$'
reg_ipv6='^(((0?|[1-9]|[a-f]){3}(0|[1-9]|[a-f])[:]){7}((0?|[1-9]|[a-f]){3}(0|[1-9]|[a-f])))$'
for(( i=0;i<N;i++ ))
do
	if [[ ${mas[$i]} =~ $reg_ipv4 ]];
	then
		echo "IPv4"
	elif [[ ${mas[$i]} =~ $reg_ipv6 ]];
	then
		echo "IPv6"
	else
		echo "Neither"
	fi
done
