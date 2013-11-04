# ps


## find parent pid
`ps -p 2271054 -o ppid  --no-header`


##kill all


```
ps -ef | grep "keywords" | grep -v "grep"| awk '{print $2}' | xargs -I {} kill {}

```