#nginx 


## install deiban

```
deb http://ftp.debian.org/debian wheezy-backports main contrib non-free
deb-src http://ftp.debian.org/debian wheezy-backports main contrib non-free

aptitude update
aptitude -t wheezy-backports install nginx-full
```

## Proxy set header

```
	proxy_set_header Host $http_host;
	proxy_set_header X-Forward-For $remote_addr;
	proxy_set_header Connection "";
	proxy_http_version 1.1;
```

## socket.io

* <http://michieldemey.be/blog/proxying-websockets-with-nginx-and-socket-io/>

## Nginx错误日志分析

* <http://cjhust.blog.163.com/blog/static/175827157201271455831385/>
* <http://www.kzhns.com/?p=32>

## server_name


* `_` means other domain
* `""` means direct ip ???


Refer: <http://nginx.org/en/docs/http/server_names.html>


##error page



```
error_page 502 /client/error.html;
```


## upstream  

```
server {
	listen *:80;
	server_name domainName;

	upstream backend {
      ip_hash;
      server   192.168.88.1  weight=2;
      server   192.168.88.2  max_fails=3  fail_timeout=30s;
      server   192.168.88.3  down;
      server   192.168.88.4;
    }

    location / {
        proxy_pass http://bakend/;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

```
###1.轮询（默认）

每个请求按时间顺序逐一分配到不同的后端服务器，如果后端服务器down掉，能自动剔除。

###2.weight

　　指定轮询几率，weight和访问比率成正比，用于后端服务器性能不均的情况。

```
upstream bakend { 
server 192.168.0.14 weight=10; 
server 192.168.0.15 weight=10; 
}
```

###3. ip_hash

每个请求按访问ip的hash结果分配，这样每个访客固定访问一个后端服务器，可以解决session的问题。


```
upstream bakend { 
ip_hash; 
server 192.168.0.14:88; 
server 192.168.0.15:80; 
}

```

###4. fair（第三方）
　　按后端服务器的响应时间来分配请求，响应时间短的优先分配。

```
upstream backend { 
server server1; 
server server2; 
fair; 
}
```

###5. url_hash（第三方）
按访问url的hash结果来分配请求，使每个url定向到同一个后端服务器，后端服务器为缓存时比较有效。

　　例：在upstream中加入hash语句，server语句中不能写入weight等其他的参数，hash_method是使用的hash算法
　　

```
upstream backend { 
server squid1:3128; 
server squid2:3128; 
hash $request_uri; 
hash_method crc32; 
}

```

* tips:
　　upstream bakend{#定义负载均衡设备的Ip及设备 状态　　

```
ip_hash; 
server 127.0.0.1:9090 down; 
server 127.0.0.1:8080 weight=2; 
server 127.0.0.1:6060; 
server 127.0.0.1:7070 backup; 
}
```


Others


```

在需要使用负载均衡的server中增加
　　proxy_pass http://bakend/;
　　每个设备的状态设置为:
　　1.down 表示单前的server暂时不参与负载
　　2.weight 默认为1.weight越大，负载的权重就越大。
　　3.max_fails ：允许请求失败的次数默认为1.当超过最大次数时，返回proxy_next_upstream 模块定义的错误
　　4.fail_timeout:max_fails次失败后，暂停的时间。
　　5.backup： 其它所有的非backup机器down或者忙的时候，请求backup机器。所以这台机器压力会最轻。
　　nginx支持同时设置多组的负载均衡，用来给不用的server来使用。
　　client_body_in_file_only 设置为On 可以讲client post过来的数据记录到文件中用来做debug
　　client_body_temp_path 设置记录文件的目录 可以设置最多3层目录
　　location 对URL进行匹配.可以进行重定向或者进行新的代理 负载均衡　
　　
```


　　
　　　　　　　　　　
* Reference <http://wiki.nginx.org/HttpUpstreamModule>


* From <http://tech.ddvip.com/2009-07/1246936747125436.html>


## upstream too big problem

在http里加上

```
proxy_buffer_size  128k;
proxy_buffers   32 32k;
proxy_busy_buffers_size 128k;

```


## 413 Request Entity Too Large

在http里加上


```
client_max_body_size 20m;

```

#module



#HttpStubStatusModule

<http://wiki.nginx.org/HttpStubStatusModule>



#LUA read file

```
 location @500 {                     
        proxy_connect_timeout 120s;     
                                        
        content_by_lua '                
            return ngx.exec("/500.html")
        ';                              
    }  
    
```
