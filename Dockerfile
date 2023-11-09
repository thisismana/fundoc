FROM rust:1.73.0

ADD . /opt/src
RUN cd /opt/src && cargo install --path .
# /usr/local/bin/fundoc

WORKDIR /opt

ENTRYPOINT /usr/local/cargo/bin/fundoc
