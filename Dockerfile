FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt -qq install -y mkvtoolnix mediainfo

RUN git clone https://github.com/axiomatic-systems/Bento4.git
WORKDIR /usr/src/app/Bento4/cmakebuild

RUN apt install -y libprotobuf-dev protobuf-compiler

RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make
RUN make install

WORKDIR /usr/src/app  

COPY requirements.txt . 
RUN python3 -m pip install --upgrade pip 
