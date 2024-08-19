FROM ubuntu:20.04
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
RUN echo "Asia/Shanghai" | tee /etc/timezone
RUN apt-get update && apt-get install -y \
    openssh-server \
    ca-certificates \
    vim \
    neovim \
    git \
    gitk \
    tig \
    tmux \
    zip \
    unzip \
    tree \
    wget \
    curl \
    fzf \
    axel \
    ripgrep \
    rsync \
    meld \
    expect \
    sshpass \
    libssl-dev \
    tree \
    lsof \
    htop \
    build-essential \
    && apt-get clean

WORKDIR /root/openSource/
RUN git clone https://github.com/microsoft/vcpkg.git && cd vcpkg &&./bootstrap-vcpkg.sh && cd..
