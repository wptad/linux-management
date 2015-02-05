#benchmark tool


## Siege

```
apt-get install siege

```


## slowhttptest

```
sudo aptitude install slowhttptest -y
slowhttptest -c 5000 -t POST -u http://www.example.com/Save -l 3600
```

## ab

```
echo 'sjname=test@apple.com&sjpass=test' > p 
ab -n 100000 -c 1000 -p p -T 'application/x-www-form-urlencoded' http://example.com/Save

```
