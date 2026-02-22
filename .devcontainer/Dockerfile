FROM ghcr.io/anacierdem/n64-unfloader:latest AS unf
FROM ghcr.io/dragonminded/libdragon:latest AS libdragon

FROM ghcr.io/anacierdem/ares:latest AS ares

# UNF dependencies
RUN apt-get install \
    libftdi1-dev \
    unzip \
    -yq

# Setup paths for the libdragon toolchain
ENV N64_INST=/home/ubuntu/.local

COPY --from=unf /unf/UNFLoader/UNFLoader ${N64_INST}/bin/UNFLoader
COPY --from=libdragon /n64_toolchain ${N64_INST}
RUN cp -r /ares/build/rundir/. ${N64_INST}

USER ubuntu