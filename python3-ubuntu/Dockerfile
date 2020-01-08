FROM ubuntu:16.04

MAINTAINER wangzhiwen@163.com

ENV LANG C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	&& apt-get install gcc g++ gdb -y

RUN apt-get install software-properties-common -y \
	&& add-apt-repository ppa:deadsnakes/ppa -y \
	&& apt-get update \
	&& apt-get install python3.6 python3-pip -y \
	&& ln -sf /usr/bin/python3.6 /usr/bin/python \
	&& ln -sf /usr/bin/pip3 /usr/bin/pip \
	&& mkdir -p /root/.pip \
	&& echo '[global]\nindex_url = https://pypi.doubanio.com/simple' > /root/.pip/pip.conf \
	&& pip install --upgrade --no-cache-dir pip
