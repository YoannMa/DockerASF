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
    apt-get install -y unzip && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/JustArchi/ArchiSteamFarm/releases/download/${GIT_TAG}/ASF.zip ASF.zip

RUN unzip ASF.zip -d ${ASF_PATH} && \
    rm ${ASF_PATH}/config/example.json && rm ${ASF_PATH}/config/minimal.json

WORKDIR ${ASF_PATH}

COPY bot.json ${ASF_PATH}/config

CMD ["mono","ASF.exe"]

