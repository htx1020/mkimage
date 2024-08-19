FROM ubuntu:20.04
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
    litecli \
    build-essential \
    && apt-get clean
