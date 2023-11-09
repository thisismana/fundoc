FROM rust:1.73.0 as builder

ADD . /opt/src
RUN cd /opt/src && cargo install --path .


FROM debian:trixie-slim
RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/cargo/bin/fundoc /usr/local/bin/fundoc

WORKDIR /opt

ENTRYPOINT fundoc
