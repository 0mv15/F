FROM ubuntu:22.04

WORKDIR /usr/src/app
SHELL ["/bin/bash", "-c"]
RUN chmod 777 /usr/src/app

RUN apt -qq update

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt-get update && apt-get -y install cmake
RUN apt-get install -y software-properties-common mediainfo wget git mkvtoolnix aria2 unzip
RUN add-apt-repository ppa:stebbins/handbrake-releases
RUN apt -qq install -y python3 python3-pip
RUN apt -qq install -y handbrake-cli ffmpeg 

RUN git clone https://github.com/axiomatic-systems/Bento4.git
WORKDIR /usr/src/app/Bento4/cmakebuild

RUN apt install -y libprotobuf-dev protobuf-compiler

RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make
RUN make install

WORKDIR /usr/src/app

COPY requirements.txt .
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade Pillow
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
CMD ["bash", "start.sh"]
