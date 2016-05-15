<!--![image](./logo.png =60)-->
<img src="https://raw.githubusercontent.com/nunchuk/docker-shadowsocks/master/logo.png" width="60" />

# Shadowsocks Dockerized

This Docker image is build from the Shadowsocks-python v2.8.2, based on [aliyun-ubuntu v14.04](https://github.com/nunchuk/aliyun-ubuntu).

* `python-2.8.2-server`
* `python-2.8.2-client`

## Quick start Shadowsocks server using:

```
docker run --name shadowsocks-server -d \
    --publish 8388:8388 \
    --env 'PASSWORD=you-password' \
    --restart=always \
    --user=nobody
    nunchuk/shadowsocks:python-2.8.2-server
```

## Quick start Shadowsocks client using:

Assuming that the Shadowsocks server host is 192.168.1.100

```
docker run --name shadowsocks-client -d \
    --publish 1080:1080 \
    --env 'SERVER_ADDR=192.168.1.100' \
    --env 'PASSWORD=you-password' \
    --restart=always \
    --user=nobody
    nunchuk/shadowsocks:python-2.8.2-client
```

## Configuration Parameters

You can adjust the configuration of the shadowsocks instance by passing one or more environment variables on the `docker run` command line.

### Shadowsocks server

* `CONFIG`			path to config file
* `SERVER_ADDR`	server address, default: 0.0.0.0
* `SERVER_PORT`	server port, default: 8388
* `PASSWORD`		password used for encryption
* `METHOD`			encryption method, default: aes-256-cfb. else rc4-md5
* `TIMEOUT`		timeout in seconds, default: 300
* `WORKERS`		number of spawning child processes

### Shadowsocks client

* `SERVER_ADDR`	server address
* `SERVER_PORT`	server port, default: 8388
* `LOCAL_ADDR`		the address your local listens, default: 0.0.0.0
* `LOCAL_PORT`		local port, default: 1080
* `PASSWORD`		password used for encryption
* `METHOD`			encryption method, default: aes-256-cfb. else rc4-md5
* `TIMEOUT`		timeout in seconds, default: 300
* `WORKERS`		number of spawning child processes
  
### You can use a configuration file instead of environment variables.
  
`docker run nunchuk/shadowsocks:python-2.8.2-server ssserver -c ./shadowsocks.json
`

Contributors
-------------------
* XinYe (nunchuk@live.com)