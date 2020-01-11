FROM suadminwen/python3-ubuntu:latest

WORKDIR /root/

COPY ./.pypipassword ./
COPY ./pypi_supervisord.conf ./

RUN apt-get install -y apache2-utils

RUN pip install supervisor \
	&& echo_supervisord_conf > /etc/supervisord.conf \
	&& echo '[include]\nfiles = /etc/supervisor/conf.d/*.conf' >> /etc/supervisord.conf \
	&& mkdir -p /etc/supervisor/conf.d

RUN pip install pypiserver passlib

RUN mv pypi_supervisord.conf /etc/supervisor/conf.d \
	&& mkdir -p /root/packages \
	&& mkdir -p /var/log/supervisor \
	&& touch /var/log/supervisor/pypi.log
    
EXPOSE 31415
 
ENTRYPOINT ["/usr/local/bin/supervisord"]
