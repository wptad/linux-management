#ulimit

## dibian

* /etc/security/limits.conf 

```
*		soft	nofile		1024000
root		soft	nofile		1024000
*		hard	nofile		1024000
root		hard	nofile		1024000

```

## mac

` launchctl limit maxfiles 1024000 1024000`
OR

```
 /etc/launchd.conf
 
 limit maxfiles 1024000 1024000


```

* good reference: <http://docs.basho.com/riak/latest/ops/tuning/open-files-limit/>
* <https://helpdesk.crashplan.com/entries/23997797-Troubleshooting-Too-many-open-files->
* refer<http://alancastro.org/2010/09/07/increase-the-number-of-opened-files-on-debian-linux.html>
