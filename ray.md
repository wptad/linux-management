在docker里，尽量使用host模式(--net=host)，原因如下：
- worker会主动连接head服务，这个不用host也没问题的
- raylet启动时，他会监听一个地址，在log会显示。注意这个地方，从ray-head里是否能访问到worker的raylet服务端口，如果访问不到，那么就会导致raylet连接超时
- worker同时也会启动10001～19999的端口地址，如果网络不在一个网段，再没有增加路由的情况下，会访问不到的

### ray自定义镜像：
如果worker里运行的代码里有包，最好自己打包一个镜像，很可能远程拉包失败，但是又看不到日志，现象就是不工作。

```
Dockerfile:

FROM ray-project/ray:2.30.0-py311
RUN pip install scipy==1.13.1 pyswarms==1.3.0 pandas==2.2.1 numpy 

```


### ray head 启动脚本 
- head也会默认启动raylet的worker，为了避免head的性能问题，把worker禁掉： --num-cpus=0
- block是为了在docker里启动不进入daemon模式
- 6380是因为跟redis的端口冲突了，我改了一下
```
ray start --head --num-cpus=0 --port=6380 --dashboard-host=0.0.0.0 --block
```

### ray woker 启动脚本 
- dorker下，使用--net=host模式

```
ray start --address=RAY_ADDRESS:6380 --block

```


### 其它
- ray的head，client，以及worker都指定同一个版本，任一个模板不匹配就会出问题
- ray的dashboard: 127.0.0.1:8265
- ray的服务address: 127.0.0.1:10001
