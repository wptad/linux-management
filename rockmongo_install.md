#Rockmongo install

##ubuntu

```sudo apt-get nginx```

```sudo apt-get install php5 php5-cgi php5-cli php-pear php5-dev ```

```sudo pecl install mongo```

```

nano /etc/php5/fpm/php.ini

add this to php.ini: 

extension=mongo.so

``` 

```/etc/init.d/php5-fpm restart```

* nginx setting


```

location ~ \.php$ {
                # With php5-cgi alone:
                fastcgi_pass 127.0.0.1:9000;
                # With php5-fpm:
                # fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                fastcgi_index index.php;
                include fastcgi_params;
        }

```

* <http://www.mkfoster.com/2009/01/04/how-to-install-a-php-pecl-extensionmodule-on-ubuntu/>
* <http://www.php.net/manual/en/mongo.installation.php#mongo.installation.manual>