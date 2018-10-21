# Docker常用命令大全

## 分类
### 容器生命周期管理

- [run](#run)
- [start/stop/restart](#startstoprestart)
- [rm](#rm)
- [exec](#exec)

### 容器操作

- [ps](#ps)

### 镜像仓库

- [login](#login)
- [pull](#pull)
- [push](#push)
- [search](#search)

### 本地镜像管理

- [images](#images)
- [rmi](#rmi)
- [tag](#tag)
- [build](#build)

## 命令详情

### run

docker run ：创建一个新的容器并运行一个命令

    docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

OPTIONS说明：

- -d: 后台运行容器，并返回容器ID
- -i: 以交互模式运行容器，通常与 -t 同时使用
- -p: 端口映射，格式为：主机(宿主)端口:容器端口
- -t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用
- --name="nginx-lb": 为容器指定一个名称

### start/stop/restart

docker start :启动一个或多少已经被停止的容器
docker stop :停止一个运行中的容器
docker restart :重启容器

### rm

docker rm ：删除一个或多少容器

    docker rm [OPTIONS] CONTAINER [CONTAINER...]

OPTIONS说明：

- -f :通过SIGKILL信号强制删除一个运行中的容器

### exec

docker exec ：在运行的容器中执行命令

    docker exec [OPTIONS] CONTAINER COMMAND [ARG...]

OPTIONS说明：
- -d :分离模式: 在后台运行
- -i :即使没有附加也保持STDIN 打开
- -t :分配一个伪终端，通常与 -i 同时使用

在容器mynginx中开启一个交互模式的终端

    docker exec -it  mynginx bash

### ps

docker ps : 列出容器

    docker ps [OPTIONS]

OPTIONS说明：
- -a :显示所有的容器，包括未运行的
- -l :显示最近创建的容器

### login

docker login : 登陆到一个Docker镜像仓库，如果未指定镜像仓库地址，默认为官方仓库 Docker Hub
docker logout : 登出一个Docker镜像仓库，如果未指定镜像仓库地址，默认为官方仓库 Docker Hub

### pull

docker pull : 从镜像仓库中拉取或者更新指定镜像

### push

docker push : 将本地的镜像上传到镜像仓库,要先登陆到镜像仓库

### search

docker search : 从Docker Hub查找镜像

### images

docker images : 列出本地镜像

docker images [OPTIONS] [REPOSITORY[:TAG]]

OPTIONS说明：

- -a :列出本地所有的镜像（含中间映像层，默认情况下，过滤掉中间映像层）

### rmi

docker rmi : 删除本地一个或多少镜像

docker rmi [OPTIONS] IMAGE [IMAGE...]

OPTIONS说明：

- -f :强制删除

### tag

docker tag : 标记本地镜像，将其归入某一仓库

    docker tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]

### build

docker build 命令用于使用 Dockerfile 创建镜像

    docker build [OPTIONS] PATH | URL | -

OPTIONS说明：

- --rm :设置镜像成功后删除中间容器
- --tag, -t: 镜像的名字及标签，通常 name:tag 或者 name 格式；可以在一次构建中为一个镜像设置多个标签

使用当前目录的 Dockerfile 创建镜像，标签为 runoob/ubuntu:v1

    docker build -t runoob/ubuntu:v1 . 
