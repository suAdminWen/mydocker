FROM alpine
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories 
RUN apk update --no-cache \
    && apk add --no-cache python3 \
    && cd /usr/bin \
    && ln -sf pip3 pip \
    && mkdir -p /root/.pip \
	&& echo -e '[global]\nindex_url = https://pypi.doubanio.com/simple' > /root/.pip/pip.conf \
    && pip install --upgrade --no-cache-dir pip

WORKDIR ~

RUN apk add supervisor \
	&& pip install pypiserver
    
EXPOSE 31415
 
ENTRYPOINT ["pypi-server -p 31415"]
