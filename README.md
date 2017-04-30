# DockerASF

A docker image allowing to start an ArchiSteamFarm instance with the pre-configured configuration

# Usage

`docker run -dit --name ArchiSteamFarm yoannm/archisteamfarm`

and now you can attach your newly created docker to connect your account :

`docker attach $( docker ps -lq )`

to leave the docker press CTRL+P or CTRL+Q (not CTRL+C, it'll kill the process)

## Using a volume

You can attach a volume to your current configuration (or if you want to save your config) :

`docker run -dit -v path/to/myconfig/:/asf/out/config --name ArchiSteamFarm yoannm/archisteamfarm`

# Info

Using Travis with a CRON to build weekly images (or daily) matching the last version of ASF