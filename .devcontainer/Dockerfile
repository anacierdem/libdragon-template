FROM ghcr.io/anacierdem/ares:latest AS ares
FROM ghcr.io/anacierdem/n64-unfloader:latest AS unf
FROM ghcr.io/dragonminded/libdragon:latest AS libdragon

FROM ubuntu:24.04

# install dependencies
RUN apt-get update && apt-get install \
    git \
    # Build system
    build-essential \
    cmake \
    pkg-config \
    curl \
    # clang, ninja, ccache
    clang \
    ninja-build \
    ccache \
    # ares deps
    libgtk-3-dev \
    libcanberra-gtk-module \
    libgl-dev \
    # audio
    libasound2-dev \
    libao-dev \
    libopenal-dev \
    libpulse-dev \
    libudev-dev \
    -yq

RUN apt-get install \
    # UNF dependencies
    libftdi1-dev \
    unzip \
    -yq

# Setup paths for the libdragon toolchain
ENV N64_INST=/home/ubuntu/.local

USER ubuntu

COPY --from=libdragon /n64_toolchain ${N64_INST}
COPY --from=ares /ares/build/rundir ${N64_INST}

WORKDIR ${N64_INST}/bin
RUN curl -L https://github.com/buu342/N64-UNFLoader/releases/download/v2.2/UNFLoader-Linux-x64.zip --output UNFLoader.zip && \
    unzip UNFLoader.zip && \
    rm UNFLoader.zip installer_linux.sh && \
    chmod u+x ./UNFLoader