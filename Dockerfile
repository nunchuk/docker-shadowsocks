############################################################ 
# Dockerfile to build shadowsocks image
# Based on aliyun-ubuntu:14.04
############################################################

FROM index.alauda.cn/nunchuk/aliyun-ubuntu:14.04
MAINTAINER XinYe <nunchuk@live.com>

# install python shadowsocks
RUN apt-get update && \
    apt-get install -y python-pip
RUN pip install shadowsocks==2.8.2


ADD /common/config_sample.yml /docker-registry/config/config_sample.yml
ENV SETTINGS_FLAVOR oss

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/ssserver"]