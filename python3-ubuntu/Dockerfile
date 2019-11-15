FROM ubuntu:16.04

ENV LANG C.UTF-8

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
	&& apt-get clean \
	&& apt-get update

RUN apt-get install python3 -y \
	&& apt-get install python3-pip -y \
	&& mkdir -p /root/.pip \
	&& echo '[global]\nindex_url = https://pypi.doubanio.com/simple' > /root/.pip/pip.conf \
	&& ln -sf /usr/bin/pip3 /usr/bin/pip \
	&& pip install --upgrade --no-cache-dir pip
