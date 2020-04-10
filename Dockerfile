FROM java:openjdk-8-jre

MAINTAINER Brayden Tan <braydentanfh@gmail.com>

# download and unpack elasticsearch
RUN wget -q https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.6.tar.gz -O - | tar zxvf - && \
	mv /elasticsearch-1.7.6 /elasticsearch && \
	rm /elasticsearch/bin/*.exe

ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

VOLUME ["/data", "/logs"]

EXPOSE 9200 9300
CMD ["elasticsearch/bin/elasticsearch", "elasticsearch/bin/plugin"]

RUN elasticsearch/bin/plugin install mobz/elasticsearch-head