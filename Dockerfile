FROM quay.io/aptible/ubuntu:14.04

RUN apt-get update
RUN apt-get -y install sasl2-bin memcached

ADD templates/memcached-sasl /usr/bin/memcached-sasl
RUN chmod +x /usr/bin/memcached-sasl

ENV PORT 3000
EXPOSE 3000

# Integration tests
ADD test /tmp/test
RUN bats /tmp/test

CMD /usr/bin/memcached -u root -p $PORT
