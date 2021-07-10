FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install python3 python3-pip python3-setuptools wget default-jre


RUN wget http://katze.tfiu.de/projects/phyghtmap/phyghtmap_2.23-1_all.deb
RUN apt install -y ./phyghtmap_2.23-1_all.deb

RUN pip3 install osmium pyclipper geojson

RUN mkdir /vasam
COPY . /vasam

WORKDIR /vasam

RUN python3 prepare.py

VOLUME [ "/vasam/maps" ]
VOLUME [ "/vasam/polygons" ]
VOLUME [ "/vasam/userAreas" ]
VOLUME [ "/vasam/pbf" ]

ENV area CZ
ENV encoding unicode

CMD ["sh", "-c", "./docker_cmd.sh $area $encoding"]
