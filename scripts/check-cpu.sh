#!/usr/bin/bash
# REF <http://wenxueliu.github.io/blog/08/28/2014/cpu-statics/>
# calculate the cpu usage of a single process
# jvehent oct.2013

[ -z $1 ] && echo "usage: $0 <pid>"

sfile=/proc/$1/stat
if [ ! -r $sfile ]; then echo "pid $1 not found in /proc" ; exit 1; fi

proctime=$(cat $sfile|awk '{print $14}')
totaltime=$(grep '^cpu ' /proc/stat |awk '{sum=$2+$3+$4+$5+$6+$7+$8+$9+$10; print sum}')

#echo "time                        ratio      cpu%"

while [ 1 ]; do
	sleep 0.2
	prevproctime=$proctime
	prevtotaltime=$totaltime
	proctime=$(cat $sfile|awk '{print $14}')
	totaltime=$(grep '^cpu ' /proc/stat |awk '{sum=$2+$3+$4+$5+$6+$7+$8+$9+$10; print sum}')
        in_use=`expr $proctime - $prevproctime`
        all=`expr $totaltime - $prevtotaltime`
        #echo $in_use
        #echo $all
        ratio=`awk 'BEGIN{printf "%.2f%\n",('$in_use'/'$all')*100*40}'`
	#ratio=$(echo "scale=2;($proctime - $prevproctime) / ($totaltime - $prevtotaltime)"|bc -l)
	echo `date +"%T.%3N"` "$ratio;"
done
