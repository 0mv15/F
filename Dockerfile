FROM ubuntu:22.04 
 
WORKDIR /usr/src/app
SHELL ["/bin/bash", "-c"]
RUN chmod 777 /usr/src/app
 
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Asia/Kolkata 

RUN apt -qq update

RUN dpkg --add-architecture i386

RUN apt-get -y update
RUN apt-get install -y python3 python3-pip software-properties-common wget \
    git pv jq libmagic-dev unzip wine64 wine32 
RUN add-apt-repository ppa:savoury1/ffmpeg5
RUN add-apt-repository ppa:savoury1/ffmpeg4
RUN apt -qq install -y ffmpeg  

COPY requirements.txt . 
RUN python3 -m pip install --upgrade pip 
RUN python3 -m pip install --upgrade Pillow 
RUN pip3 install --no-cache-dir -r requirements.txt 
 
COPY . . 
CMD ["bash", "start.sh"]
