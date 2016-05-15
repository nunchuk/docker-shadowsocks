############################################################ 
# Dockerfile to build shadowsocks server image
# Based on aliyun-ubuntu:14.04 trusty
############################################################

FROM nunchuk/aliyun-ubuntu:14.04
MAINTAINER XinYe <nunchuk@live.com>

ENV SS_VERSION=2.8.2

# install shadowsocks-python
RUN apt-get update && \
    apt-get install -y python-pip && \
    pip install shadowsocks==$SS_VERSION && \
    rm -rf /var/lib/apt/lists/*

# configure environments
ENV SERVER_ADDR=0.0.0.0 \
    SERVER_PORT=8388 \
    PASSWORD=youpassword \
    METHOD=aes-256-cfb \
    TIMEOUT=300 \
    WORKERS=10

EXPOSE $SERVER_PORT/tcp

# configure container to run as an executable
#ENTRYPOINT ["/usr/local/bin/ssserver"]
#CMD ["-k $PASSWORD -m $METHOD"]

# this line not work, i don't know why
#ENTRYPOINT ["/usr/local/bin/ssserver","-k", "$PASSWORD", "-m", "$METHOD"]

# CMD shell way to run the container
CMD ssserver -s "$SERVER_ADDR" \
             -p "$SERVER_PORT" \
             -k "$PASSWORD" \
             -m "$METHOD" \
             -t "$TIMEOUT" \
             --workers "$WORKERS" \
             --fast-open