#!/bin/bash
read N
cnt=0
for(( i=1;;i=i*10 ))
do
	if(( N==0 ))
	then
		cnt=1
		break
	elif(( N/i!=0 ))
	then
		(( cnt++ ))
	else
		break
	fi
done
if(( cnt==1 ))
then
	echo "$N"
	echo "NULL"
else
	declare -a mas
	for(( i=cnt-1;i>=0;i-- ))
	do
		(( mas[i]=N%10 ))
		(( N=N/10 ))
	done
	for(( i=0;i<cnt;i++ ))
	do
		(( kmas[i]=mas[i] ))
	done
	for(( i=0;i<cnt;i++ ))
	do
	    min=$i
	    for(( j=i+1;j<cnt;j++ ))
	    do
	        if(( mas[j]<mas[min] ))
	        then
	            min=$j
	    	fi
	    done
	    temp=${mas[$i]}      
	    mas[i]=${mas[$min]}
	    mas[min]=$temp
	done
	sw=0
	if(( cnt%2==0 ))
	then
		(( av=(cnt-1)/2 ))
		(( value=mas[av] ))
	else
		(( av=cnt/2 ))
		(( value=mas[av] ))
	fi
	for(( i=0;i<cnt-1;i++ ))
	do
		if(( mas[i]==mas[i+1] ))
		then
			(( sw++ ))
		fi
	done
	if(( sw==cnt-1 ))
	then
		echo "${kmas[0]}"
		echo "NULL"
	else
		for(( i=0;i<cnt;i++ ))
		do
			if(( kmas[i]!=value ))
			then
				Y=${kmas[$i]}
				X+=$Y
			fi
		done
		echo "$value"
		echo "$X"
	fi
fi		
