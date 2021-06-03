FROM alpine

ARG CORE=arm64

FROM multiarch/ubuntu-core:${CORE}-focal

WORKDIR /opt
ARG PY_VERSION=3.7.4
ARG LOCAL_APT=yes

RUN if [ "$LOCAL_APT" == "yes" ]; then sed -i 's/ports.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN  \ 
    && apt-get update \
    && apt-get install -y wget build-essential libsqlite3-dev bzip2 libbz2-dev libssl-dev zlib1g-dev libffi-dev libreadline-dev libsqlite3-dev

# ADD Python-${PY_VERSION}.tgz .

RUN wget https://www.python.org/ftp/python/${PY_VERSION}/Python-${PY_VERSION}.tgz && \
    tar -zxvf Python-${PY_VERSION}.tgz && \
    rm Python-${PY_VERSION}.tgz && \
    ln -s /opt/Python-${PY_VERSION} /opt/Python && \
    cd /opt/Python && \
    ls

# RUN ln -s /opt/Python-${PY_VERSION} /opt/Python && \
#     cd /opt/Python && \
#     ls

RUN cd /opt/Python && \
    ./configure --enable-optimizations && \
    make -j4 && \
    make install 

RUN python3 --version && \
    pip3 --version