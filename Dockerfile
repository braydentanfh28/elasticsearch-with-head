FROM java:openjdk-8-jre

MAINTAINER Brayden Tan <braydentanfh@gmail.com>

# download and unpack elasticsearch
RUN wget -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.2.tar.gz -O - | tar zxvf - && \
	mv /elasticsearch-6.3.2 /elasticsearch && \
	rm /elasticsearch/bin/*.exe

ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

VOLUME ["/data", "/logs"]

EXPOSE 9200 9300
ENTRYPOINT elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true