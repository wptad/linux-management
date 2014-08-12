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