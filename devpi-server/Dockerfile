FROM suadminwen/python3-ubuntu:latest

WORKDIR /root/

RUN pip install supervisor

RUN pip install devpi-server devpi-web devpi-lockdown \
	&& devpi-init \
	&& devpi-gen-config --host 0.0.0.0 --port 3141
	#&& sed -i '/\[supervisord\]/a\nodaemon=true' gen-config/supervisord.conf

RUN apt update \
	&& apt install nginx -y

COPY ./nginx-devpi.conf /etc/nginx/sites-enabled/default
COPY ./run.sh /root/

EXPOSE 3141
EXPOSE 80
 
ENTRYPOINT ["bash", "run.sh"]
