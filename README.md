[![Build Status](https://travis-ci.org/YoannMa/DockerASF.svg?branch=master)](https://travis-ci.org/YoannMa/DockerASF)&nbsp;
[![Docker Pulls](https://img.shields.io/docker/pulls/yoannm/archisteamfarm.svg)](https://hub.docker.com/r/yoannm/archisteamfarm/)&nbsp;
[![Image size](https://images.microbadger.com/badges/image/yoannm/archisteamfarm.svg)](https://hub.docker.com/r/yoannm/archisteamfarm/tags/)&nbsp;
[![Image version](https://images.microbadger.com/badges/version/yoannm/archisteamfarm.svg)](https://hub.docker.com/r/yoannm/archisteamfarm/tags/)

# Deprecated

As ASF got their own Docker image, this is not really useful anymore

# DockerASF

A docker image allowing to start an ArchiSteamFarm instance with the pre-configured configuration

# Usage

`docker run -dit --name ArchiSteamFarm yoannm/archisteamfarm`

and now you can attach your newly created docker to connect your account :

`docker attach $( docker ps -lq )`

to leave the docker press CTRL+P or CTRL+Q (not CTRL+C, it'll kill the process)

## Using a volume

You can attach a volume to your current configuration (or if you want to save your config) :

`docker run -dit -v path/to/myconfig/:/asf/config --name ArchiSteamFarm yoannm/archisteamfarm`

# Info

Using Travis with a CRON to build weekly images (or daily) matching the last version of ASF
