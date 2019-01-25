From ubuntu:16.04
LABEL maintainer='gyq'
ENV LANG C

RUN apt-get update
RUN apt-get install -y supervisor
COPY supervisord.conf /etc/supervisord.conf

RUN apt-get update \
    && apt-get install -y python3-pip python3-dev locales\
    && pip3 install --upgrade pip

RUN mkdir -p /app
COPY . /app

RUN pip install -r /app/requirements.txt

EXPOSE 5000

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
