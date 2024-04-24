## mysql


## install in debian


```
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install mysql-server mysql-client

```

*<https://ariejan.net/2007/12/12/how-to-install-mysql-on-ubuntudebian/>

* initial 

``` 
mysql_install_db --user=mysql --datadir=/hdd3/mysql/

```



## privileges


```
1、用管理员登陆mysql
2、创建数据库create database db01;
3、创建用户
user01只能本地访问
CREATE USER user01@'localhost' IDENTIFIED BY 'password1';
user02可以远程访问
CREATE USER user02@'%' IDENTIFIED BY 'password1';
4、修改user01密码
SET PASSWORD FOR 'user01'@'localhost' = PASSWORD('password2');
5、授权
a)、user01管理db01全部权限
GRANT ALL PRIVILEGES ON db01.* TO user01;
b)、user02查看权限，并修改密码
GRANT SELECT  ON *.* TO 'user02'@'%' IDENTIFIED by 'password2';


```

## mac reset root password 


```

mysql/> UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root'


terminal/> mysqladmin -u root password 'YOURPASSWORD'
```

## my.conf tuning 



```


```

* <https://tools.percona.com/wizard/result>
* <http://stackoverflow.com/questions/10905226/mysql-my-cnf-performance-tuning-recommendations>


# mysql backup

## full backup
```
# cat /etc/systemd/system/mysql-backup-full.timer 
[Unit]
Description=full backup mysql every week

[Timer]
OnBootSec=200
RandomizedDelaySec=100
OnCalendar=Sun *-*-* 00:10:05
Persistent=true

[Install]
WantedBy=timers.target



# cat /etc/systemd/system/mysql-backup-full.service 
[Unit]
Description=full backup for mysql-1
After=mysql-1.service
[Service]
Type=oneshot
ExecStartPre=-/bin/bash -c '/usr/bin/mkdir -p /home/hdd1/mysql-backup/data'
ExecStartPre=-/bin/bash -c '/usr/bin/chmod 777 /home/hdd1/mysql-backup/data'
ExecStartPre=-/bin/bash -c '/bin/mv /home/hdd1/mysql-backup/data/base /home/hdd1/mysql-backup/full-$$(date +%%Y%%m%%d-%%H%%M%%S)'
ExecStart=/bin/bash -c "/usr/bin/docker run --rm \
-v /home/hdd1/mysql:/var/lib/mysql \
-v /home/hdd1/mysql-backup/data:/backup \
-u 999 \
perconalab/percona-xtrabackup:8.0.33-28 xtrabackup --compress --backup --host=8.8.8.8 --port=8888 --user=root --password=password --target-dir=/backup/base"

[Install]
WantedBy=multi-user.target
```

## inc backup

```

# cat /etc/systemd/system/mysql-backup-inc.timer 
[Unit]
Description=inc backup mysql every hour

[Timer]
RandomizedDelaySec=100
OnBootSec=300
OnCalendar=hourly
Persistent=true

[Install]
WantedBy=timers.target




# cat /etc/systemd/system/mysql-backup-inc.service 
[Unit]
Description=inc backup for mysql-1
After=mysql-1.service
Conflicts=mysql-backup-full.service
[Service]
Type=oneshot
ExecStart=/bin/bash -c "/usr/bin/docker run --rm \
-v /home/hdd1/mysql:/var/lib/mysql \
-v /home/hdd1/mysql-backup/data:/backup \
-u 999 \
perconalab/percona-xtrabackup:8.0.33-28 xtrabackup --compress --backup --host=8.8.8.8 --port=8888 --user=root --password=password --target-dir=/backup/inc-$$(date '+%%Y%%m%%d-%%H%%M%%S') --incremental-basedir=/backup/base"

[Install]
WantedBy=multi-user.target



```
