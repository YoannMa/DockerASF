################################################################################
# Dockerfile to run ArchiSteamFarm
# Based on Mono container
################################################################################

# Set the base image to Mono lastest
FROM microsoft/dotnet:runtime

# File Author / Maintainer
# MAINTAINER Yoann MALLEMANCHE (Yoannm)
# latest is 3.0.3.0
ARG VERSION=3.0.3.0

# Env ASF build
ENV ASF_PATH=/asf \
    VERSION=${VERSION}

LABEL org.label-schema.vcs-url="https://github.com/YoannMa/DockerASF" \
      org.label-schema.version=${VERSION}

# Install dependancies
RUN apt-get update && \
    apt-get install apt-utils -y && \
    apt-get install -y unzip && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/JustArchi/ArchiSteamFarm/releases/download/${VERSION}/ASF-linux-x64.zip ASF.zip

RUN unzip ASF.zip -d ${ASF_PATH} && \
    rm ${ASF_PATH}/config/example.json && rm ${ASF_PATH}/config/minimal.json

WORKDIR ${ASF_PATH}

COPY bot.json ${ASF_PATH}/config

CMD ["dotnet","ArchiSteamFarm.dll"]
