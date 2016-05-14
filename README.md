# Shadowsocks dockerized

This Docker image is build from the Shadowsocks-python v2.8.2, based on [aliyun-ubuntu v14.04](https://github.com/nunchuk/aliyun-ubuntu).

## Quick start Shadowsocks server using:

```
docker run shadowsocks-server -d \
    --publish 8388:8388 \
    --env 'PASSWORD=you-password' \
    --restart=always
    nunchuk/shadowsocks:2.8.2-python-server
```

## Quick start Shadowsocks client using:

```
docker run shadowsocks-client -d \
    --publish 1080:1080 \
    --env 'SERVER_ADDR=you-shadowsocks-server-ip' \
    --env 'PASSWORD=youpassword' \
    --restart=always
    nunchuk/shadowsocks:2.8.2-python-client
```

## Configuration Parameters:

* 
  -c CONFIG              path to config file
  -s SERVER_ADDR         server address, default: 0.0.0.0
  -p SERVER_PORT         server port, default: 8388
  -k PASSWORD            password
  -m METHOD              encryption method, default: aes-256-cfb
  -t TIMEOUT             timeout in seconds, default: 300
  --fast-open            use TCP_FASTOPEN, requires Linux 3.7+
  --workers WORKERS      number of workers, available on Unix/Linux
  --forbidden-ip IPLIST  comma seperated IP list forbidden to connect
  --manager-address ADDR optional server manager UDP address, see wiki

Proxy options:
  -c CONFIG              path to config file
  -s SERVER_ADDR         server address
  -p SERVER_PORT         server port, default: 8388
  -b LOCAL_ADDR          local binding address, default: 127.0.0.1
  -l LOCAL_PORT          local port, default: 1080
  -k PASSWORD            password
  -m METHOD              encryption method, default: aes-256-cfb
  -t TIMEOUT             timeout in seconds, default: 300
  --fast-open            use TCP_FASTOPEN, requires Linux 3.7+

Contributors
-------------------
* XinYe (nunchuk@live.com)