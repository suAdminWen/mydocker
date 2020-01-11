FROM suadminwen/python3-ubuntu:latest

WORKDIR /root/

COPY ./supervisor/* /etc/

RUN pip install supervisor

RUN pip install devpi-server devpi-web\
	&& devpi-init --no-root-pypi

EXPOSE 31415
 
ENTRYPOINT ["/usr/local/bin/supervisord"]
