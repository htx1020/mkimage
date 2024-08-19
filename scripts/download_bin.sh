#!/bin/bash

FLAG_USER=[ "$(id -u)" != "0" ] && echo sudo

# 新电脑安装
log_info() {
    # 黄色
    echo -e "\033[33m$*\033[0m"
}

PKG_LISTS=(
    'https://objects.githubusercontent.com/github-production-release-asset-2e65be/23357588/fd60ddfc-1c16-455d-a15f-4a2abb2c12f9?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240819%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240819T090912Z&X-Amz-Expires=300&X-Amz-Signature=3d9c2235375087cd8401c72b32f7bed9d2b55902c153ac6e9ba91523552abfbf&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=23357588&response-content-disposition=attachment%3B%20filename%3Dprotoc-27.3-linux-x86_64.zip&response-content-type=application%2Foctet-stream'
)

mkdir -p pkgs
cd pkgs

# 下载软件包
for PKG in ${PKG_LISTS[@]}; do
    log_info "Downloading $PKG..."
    axel -a -n 10 $PKG
done
