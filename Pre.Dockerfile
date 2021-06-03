FROM multiarch/ubuntu-core:{CORE}-focal

ARG LOCAL_APT=yes

RUN [ "$LOCAL_APT" == "yes" ]  && sed -i 's/ports.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list || true

RUN apt-get update \
    && apt-get install -y wget build-essential libsqlite3-dev bzip2 libbz2-dev libssl-dev zlib1g-dev libffi-dev libreadline-dev libsqlite3-dev
