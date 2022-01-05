## rsync


* using rsync to copy files

```
 rsync -avz -e "ssh -p 22 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress /hdd/files.txt tad@10.10.10.10:/hdd/ 
```

### mv file example

```
rsync -abv --remove-source-files /media/localbackup/* /media/remotebackup/
```

### parallel example

```
 ls -1 -d /hdd1/log/* |parallel -X rsync -abv --remove-source-files {} /hdd2/log/
```


### run it in background
```
nohup command > nohup.log 
Control + z
bg
```
