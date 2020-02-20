FROM suadminwen/python3-ubuntu:latest

WORKDIR /root/

RUN pip install supervisor

RUN pip install devpi-server devpi-web\
	&& devpi-init \
	&& devpi-gen-config --host 0.0.0.0 --port 31415 \
	&& sed -i '/\[supervisord\]/a\nodaemon=true' gen-config/supervisord.conf

EXPOSE 31415
 
ENTRYPOINT ["/usr/local/bin/supervisord", "-c", "/root/gen-config/supervisord.conf"]
