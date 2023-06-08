FROM dawn001/z_mirror:heroku 


RUN apt -qq update

RUN dpkg --add-architecture i386

RUN apt-get -y update
RUN apt-get install -y python3 python3-pip software-properties-common wget \
    git pv jq libmagic-dev unzip wine64 wine32 mkvtoolnix

COPY requirements.txt . 
RUN python3 -m pip install --upgrade pip 
RUN python3 -m pip install --upgrade Pillow 
RUN pip3 install --no-cache-dir -r requirements.txt 
 
COPY . . 
CMD ["bash", "start.sh"]
