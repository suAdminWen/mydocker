---

用户：wen
密码：123
默认使用豆瓣源：https://pypi.doubanio.com/simple

---


## 修改用户和密码

``` bash
pip install pypiserver passlib
apt install -y apache2-utils

htpasswd -c .pypipassword $USER
# 输入密码即可
```

## 更改转发源

修改`pypi_supervisord.conf`中的`command`中的`--fallback-url`

## docker-compose 构建

```
# 使用docker-compose
docker-compose up -d --build
# 停止服务并删除image
# docker-compose down --rmi all
```

## upload package

```
python setup.py bdist_wheel upload -r http://127.0.0.1:31415
# 输入帐号和密码即可
```

## install package

- 手动输入帐号和密码

```
pip install -i http://127.0.0.1:31415/ [package]
# 输入帐号和密码即可

```

- 

```
pip install -i http://wen:123@127.0.0.1:31415 [package]
```
