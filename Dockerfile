FROM ubuntu:22.04 
 
WORKDIR /usr/src/app
SHELL ["/bin/bash", "-c"]
RUN chmod 777 /usr/src/app
 
RUN apt -qq update
 
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Asia/Kolkata 
 
RUN apt-get -y update && DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -y software-properties-common mediainfo wget git mkvtoolnix aria2 libmagic-dev
RUN add-apt-repository ppa:stebbins/handbrake-releases
RUN add-apt-repository ppa:savoury1/ffmpeg5
RUN add-apt-repository ppa:savoury1/ffmpeg4 
RUN apt -qq install -y python3 python3-pip 
RUN apt -qq install -y handbrake-cli ffmpeg  
 
COPY requirements.txt . 
RUN python3 -m pip install --upgrade pip 
RUN python3 -m pip install --upgrade Pillow 
RUN pip3 install --no-cache-dir -r requirements.txt 
 
COPY . . 
CMD ["bash", "start.sh"]
