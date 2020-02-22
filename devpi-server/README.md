pypiserver 等只支持两个索引： 私有的索引和公有的索引。 在私有索引上找不到 Python 包时， 就会去公有索引上找。devpi 可以支持多个索引。同时，新索引可以继承之前的索引，这在维护多版本系统上十分有用。

- 创建用户

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

# 本地使用

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
