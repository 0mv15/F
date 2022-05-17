FROM ubuntu:22.04 
 
RUN mkdir ./app 
RUN chmod 777 ./app 
WORKDIR /app 
 
RUN apt -qq update
RUN apt full-upgrade 
 
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Asia/Kolkata 
 
RUN apt-get update
RUN apt-get install -y software-properties-common mediainfo wget git mkvtoolnix 
RUN add-apt-repository ppa:savoury1/ffmpeg5
RUN add-apt-repository ppa:savoury1/ffmpeg4 
RUN apt -qq install -y python3 python3-pip 
RUN apt -qq install -y ffmpeg  
 
 RUN git clone https://github.com/axiomatic-systems/Bento4.git
WORKDIR /usr/src/app/Bento4/cmakebuild

RUN apt install -y libprotobuf-dev protobuf-compiler

RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make
RUN make install

WORKDIR /usr/src/app  

COPY requirements.txt . 
RUN python3 -m pip install --upgrade pip 
