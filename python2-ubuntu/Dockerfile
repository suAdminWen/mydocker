FROM ubuntu:16.04

ENV LANG C.UTF-8

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
	&& apt-get clean \
	&& apt-get update \
	&& apt-get install -y libpq-dev python-dev libxml2-dev \
		libxslt1-dev libldap2-dev libsasl2-dev libffi-dev \
	&& apt-get install -y libmysqlclient-dev

RUN apt-get install -y python python-pip \
	&& mkdir -p /root/.pip \
	&& echo '[global]\nindex_url = https://pypi.doubanio.com/simple' > /root/.pip/pip.conf \
	&& pip install --upgrade --no-cache-dir pip
