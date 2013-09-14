#netstats

netstat -tuan | grep ':8888' | awk '{arr[$6]++}END{for (i in arr){print i,arr[i]}}'