FROM elementary/docker:odin-unstable
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get --assume-yes install libsoup2.4-dev

COPY . /luna

WORKDIR /luna

RUN ls /luna/po

RUN meson build --prefix=/usr && \
    cd build && \
    ninja com.github.calo001.luna-pot && \
    ninja com.github.calo001.luna-update-po

RUN ls /luna/po