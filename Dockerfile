FROM anasty17/mltb:latest
# FROM anasty17/mltb-oracle:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt -qq install -y mkvtoolnix mediainfo

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:stebbins/handbrake-releases
RUN apt -qq install -y handbrake-cli

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
