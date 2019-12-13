FROM suadminwen/python3-ubuntu

WORKDIR /root/

COPY ./.pypipassword ./
COPY ./pypi_supervisord.conf ./

RUN apt-get install -y apache2-utils \
	&& apt-get install -y supervisor

RUN pip install pypiserver passlib

RUN mv pypi_supervisord.conf /etc/supervisor/conf.d \
	&& mkdir -p /root/packages \
	&& mkdir -p /var/log/supervisor \
	&& touch /var/log/supervisor/pypi.log
    
EXPOSE 31415
 
ENTRYPOINT ["/usr/bin/supervisord"]
