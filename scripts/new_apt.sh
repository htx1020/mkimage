#!/bin/bash

FLAG_USER=[ "$(id -u)" != "0" ] && echo sudo

# 新电脑安装
log_info() {
    # 黄色
    echo -e "\033[33m$*\033[0m"
}

# 常用软件列表
SW_LIST=(
    vim
    openssh-server
    open-vm-tools
    ca-certificates
    git
    gitk
    tig
    meld
    curl
    axel

    fzf
    ranger
    ripgrep
    rsync

    expect
    sshpass
    libssl-dev
    sysstat
    tree

    htop
    tmux
    litecli
)

$FLAG_USER apt update
# 记录开始时间
START_TIME=$(date +%s)
# 安装常用软件
for sw in ${SW_LIST[@]}; do
    log_info "Installing $sw"
    $FLAG_USER apt install $sw -y >>/dev/null 2>&1
done
# 清理临时文件
$FLAG_USER apt autoclean
$FLAG_USER apt autoremove
# 计算安装时间
END_TIME=$(date +%s)

INSTALL_TIME=$((END_TIME - START_TIME))
# 彩色打印
echo -e "\033[32mInstallation completed in $INSTALL_TIME seconds\033[0m"
