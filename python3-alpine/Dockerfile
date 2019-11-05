FROM alpine
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories 
RUN apk update --no-cache \
    && apk add --no-cache python3 python3-dev\
	&& apk add --no-cache gfortran libgcc \
    && apk add --no-cache gcc musl-dev libxml2-dev libxslt-dev\
	&& apk add --no-cache g++ freetype-dev jpeg-dev \
	&& apk add --no-cache ttf-dejavu \
    && cd /usr/bin \
    && ln -sf pip3 pip \
    && mkdir -p /root/.pip \
	&& echo -e '[global]\nindex_url = https://pypi.doubanio.com/simple' > /root/.pip/pip.conf \
    && pip install --upgrade --no-cache-dir pip

