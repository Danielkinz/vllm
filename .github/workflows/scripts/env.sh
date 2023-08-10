export LANG C.UTF-8

__PYTHON_VERSION=$1

sudo    apt-get update && \
sudo    apt-get install -y --no-install-recommends \
        software-properties-common \

sudo    apt-get install -y --no-install-recommends \
        build-essential \
        apt-utils \
        ca-certificates \
        wget \
        git \
        vim \
        libssl-dev \
        curl \
        unzip \
        unrar \
        cmake \
        net-tools \
        sudo \
        autotools-dev \
        rsync \
        jq \
        openssh-server \
        tmux \
        screen \
        htop \
        pdsh \
        openssh-client \
        lshw \
        dmidecode \
        util-linux \
        automake \
        autoconf \
        libtool \
        net-tools \
        pciutils \
        libpci-dev \
        libaio-dev \
        libcap2 \
        libtinfo5 \
        fakeroot \
        devscripts \
        debhelper \
        nfs-common

sudo add-apt-repository ppa:deadsnakes/ppa
apt install "python$__PYTHON_VERSION"
export PYTHON_EXECUTABLE="python$__PYTHON_VERSION"

sudo rm -rf "/usr/local/share/boost"
sudo rm -rf "$AGENT_TOOLSDIRECTORY"
sudo rm -rf "/usr/share/dotnet"
