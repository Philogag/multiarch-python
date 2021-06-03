FROM philogag/multiarch-python:{CORE}-none

WORKDIR /opt
ARG PY_VERSION=3.7.4

RUN wget https://www.python.org/ftp/python/${PY_VERSION}/Python-${PY_VERSION}.tgz --no-check-certificate && \
    tar -zxf Python-${PY_VERSION}.tgz && \
    rm Python-${PY_VERSION}.tgz && \
    ln -s /opt/Python-${PY_VERSION} /opt/Python && \
    cd /opt/Python && \
    ls

RUN cd /opt/Python && \
    ./configure&& \
    make -j4 && \
    make install 

RUN python3 --version && \
    pip3 --version
