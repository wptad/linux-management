# locales

## install

```
sudo apt-get purge locales
sudo aptitude install locales
sudo dpkg-reconfigure locales


```



### warning when connect to raspberry: setlocale: LC_ALL: cannot change locale (en_US.UTF-8) 

```
dpkg-reconfigure locales and ensure that en_US.UTF-8 is selected. 

```

*　<http://wiki.ubuntu.org.cn/%E4%BF%AE%E6%94%B9locale>
