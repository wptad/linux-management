
## acme.sh
使用Aliyun服务商，通过acme.sh申请nginx的SSL过程 

### 0. 安装acme.sh

```
curl https://get.acme.sh | sh -s email=yourname@domain.com 
```

更新的脚本：
```
acme.sh --upgrade

```

### 1. 创建Aliyun子账号，申请api key 

### 2. 权限为： 
```
AliyunHTTPDNSFullAccess
AliyunDNSFullAccess
```

### 3. 设置export
```
export Ali_Key=""
export Ali_Secret=""
```

### 4. 申请SSL
```
./acme.sh --issue --dns dns_ali -d DOMAIN_LIKE_*.WILDCARD.COM

```

### 5. 导出Nginx证书
```
 ./acme.sh --install-cert -d *.WILDCARD.COM \
--key-file       /home/hdd1/resty/cert/*.WILDCARD.COM.key  \
--fullchain-file /home/hdd1/resty/cert/*.WILDCARD.COM.pem 

```
### 6. reload nginx

# refer
- [阿里云域名使用ACME自动申请免费的通配符https域名证书
](https://developers.weixin.qq.com/community/develop/article/doc/0008ae40ca0af83d0d7e3bb6b56013)
- [官方文档](https://github.com/acmesh-official/acme.sh/wiki/%E8%AF%B4%E6%98%8E)
- [Docker工具](https://github.com/nginx-proxy/acme-companion?tab=readme-ov-file)
