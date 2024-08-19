#!/bin/bash

FLAG_USER=[ "$(id -u)" != "0" ] && echo sudo

# 新电脑安装
log_info() {
    # 黄色
    echo -e "\033[33m$*\033[0m"
}

PKG_LISTS=(
    'https://objects.githubusercontent.com/github-production-release-asset-2e65be/134017286/021d9fa2-84ac-4f74-82f6-df8022d53bfb?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240819%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240819T085331Z&X-Amz-Expires=300&X-Amz-Signature=619543a81cd4db582ffc80b11181ca914fb8307d2fc3898ce9a5b4d8d3862339&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=134017286&response-content-disposition=attachment%3B%20filename%3Dlazygit_0.43.1_Linux_x86_64.tar.gz&response-content-type=application%2Foctet-stream'
)

mkdir pkgs
cd pkgs

# 下载软件包
for PKG in ${PKG_LISTS[@]}; do
    log_info "Downloading $PKG..."
    axel -a -n 10 $PKG
done
