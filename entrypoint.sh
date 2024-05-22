#!/bin/bash -ex
env | sort
tailscaled --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 & tailscale up --auth-key=$TAILSCALE_AUTHKEY --hostname="github-$(cat /etc/hostname)" --accept-routes
cat /etc/resolv.conf
# export ALL_PROXY="socks5://localhost:1055/"
# export HTTP_PROXY="http://localhost:1055/"
# export http_proxy="http://localhost:1055/"

ALL_PROXY="socks5://localhost:1055/" HTTP_PROXY="http://localhost:1055/" http_proxy="http://localhost:1055/" ruby /app/jenkins_job.rb

