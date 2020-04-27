FROM ubuntu:18.04

RUN useradd -ms /bin/bash monitor

ENV TZ=Europe/Vienna
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && apt-get update && apt-get install -y software-properties-common && apt-get update \
	&& apt-get install -y rrdtool librrd-dev nginx ntp python-pip libcairo2 libcairo2-dev glib2.0 libxml2 libxml2-dev libcogl-pango-dev unzip rsync \
	&& pip install python-rrdtool 

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R monitor /home/monitor

WORKDIR /home/monitor

RUN curl -LO https://github.com/aymenfurter/officeweather/archive/master.zip && unzip master.zip && mv ./officeweather-master/* . \
	&& cp monitor.py /usr/bin \
	&& mkdir /var/local/monitor \
	&& rsync -av --progress web/* /var/www/html \
	&& mkdir /var/www/html/images \
	&& chown -R monitor /var/www/html/images

ENTRYPOINT nginx && /usr/bin/monitor.py /dev/hidraw0
