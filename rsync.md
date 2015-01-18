## rsync


* using rsync to copy files

```
 rsync -avz -e "ssh -p 22 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress /hdd/files.txt tad@10.10.10.10:/hdd/ 
```