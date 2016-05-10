############################################################ 
# Dockerfile to build shadowsocks image
# Based on aliyun-ubuntu:14.04
############################################################

FROM index.alauda.cn/nunchuk/aliyun-ubuntu:14.04
MAINTAINER XinYe <nunchuk@live.com>

# install shadowsocks-python
RUN apt-get update && \
    apt-get install -y python-pip && \
    pip install shadowsocks==2.8.2 && \
    rm -rf /var/lib/apt/lists/*

ENV MODE="server" \
    SERVER="127.0.0.1" \
    SERVER_PORT="8388" \
    PASSWORD="youpassword" \
    METHOD="aes-256-cfb"
#ADD /common/config_sample.yml /docker-registry/config/config_sample.yml


# Configure container to run as an executable
#CMD ["/usr/local/bin/ss","$MODE,"-s $SERVER","-p $SERVER_PORT","-k $PASSWORD","-m $METHOD"]
#ENTRYPOINT ["/usr/local/bin/ss"$MODE,"-s $SERVER","-p $SERVER_PORT","-k $PASSWORD","-m $METHOD"]
CMD /usr/local/bin/ss$MODE -s $SERVER -p $SERVER_PORT -k $PASSWORD -m $METHOD