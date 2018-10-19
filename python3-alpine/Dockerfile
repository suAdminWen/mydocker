FROM alpine
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories 
RUN apk update --no-cache\
		&& apk add --no-cache python3

RUN cd /usr/bin \
		&& ln -sf pip3 pip
