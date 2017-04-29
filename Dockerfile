################################################################################
# Dockerfile to build ArchiSteamFarm from source and run it
# Based on Mono container
################################################################################

# Set the base image to Mono lastest
FROM mono:latest

# File Author / Maintainer
MAINTAINER Yoann MALLEMANCHE (Yoannm)

ARG GIT_TAG=2.3.1.2

# Env ASF build
ENV ASF_PATH=/asf \
    GIT_URL=https://github.com/JustArchi/ArchiSteamFarm.git \
    GIT_TAG=${GIT_TAG}

# Install dependancies
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# clone ASF
RUN git clone ${GIT_URL} ${ASF_PATH} && \
    git checkout ${GIT_TAG}

WORKDIR ${ASF_PATH}

RUN ./cc.sh && rm out/config/example.json && rm out/config/minimal.json

COPY bot.json out/config/

CMD ["mono","out/ASF.exe"]

