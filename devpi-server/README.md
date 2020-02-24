pypiserver 等只支持两个索引： 私有的索引和公有的索引。 在私有索引上找不到 Python 包时， 就会去公有索引上找。devpi 可以支持多个索引。同时，新索引可以继承之前的索引，这在维护多版本系统上十分有用。

### 宿主机使用nginx代理容器服务

因为宿主机使用nginx的时候默认监听80端口，所有，需要将Dockerfile和docker-compose.yaml中的80端口关闭，开启31415:80

nginx 配置如下：

```
server {
     listen       80;
     server_name  devpi.example.com;
     gzip             on;
     gzip_min_length  2000;
     gzip_proxied     any;
     gzip_types       application/json;
     proxy_read_timeout 60s;
     client_max_body_size 64M;
     location / {
         proxy_pass http://127.0.0.1:31415;
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header X-outside-url $scheme://$http_host;
         proxy_set_header Host $http_host;
         proxy_set_header X-Forward-For $remote_addr;
     }
}
```

### devpi-client使用

```
# 安装客户端
pip install -U devpi-client
# 创建连接
devpi use http://localhost:31415
# 创建用户
devpi user -c devuser password=
# 用户登录
devpi login devuser --password=

# 创建索引
devpi index -c dev bases=root/pypi
# 使用索引
devpi use devuser/dev

# 上传包
devpi upload --formats bdist_wheel
devpi logout
```

### pip使用

- ~/.pip/pip.conf

```
[global]
timeout = 60
index-url = http://devpi.example.com/devuser/dev/+simple/
[install]
trusted-host = devpi.example.com
```

- pip

`pip install -i http://devpi.example.com/devuser/dev/+simple/ [package]`

需要认证时：

`pip install -i http://[user]:[password]@[host]/devuser/dev/+simple/ [package] --trusted-host [host]`

