#nginx 
* error page



```
error_page 502 /client/error.html;
```


* upstream  

```
upstream backend  {
  server backend1.example.com weight=5;
  server backend2.example.com:8080;
  server unix:/tmp/backend3;
}
 
server {
  location / {
    proxy_pass  http://backend;
  }
}

```
* Reference <http://wiki.nginx.org/HttpUpstreamModule>