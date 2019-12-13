---

用户：wen
密码：123

---


## 修改用户和密码

``` bash
pip install pypiserver passlib
apt install -y apache2-utils

htpasswd -c .pypipassword $USER
# 输入密码即可
```

## docker-compose 构建

```
# 使用docker-compose
docker-compose up -d --build
# 停止服务并删除image
# docker-compose down --rmi all
```
