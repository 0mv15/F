FROM ghcr.io/amirulsdockerhub/ultr01d_ub_docker:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt -qq install -y mkvtoolnix mediainfo

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
