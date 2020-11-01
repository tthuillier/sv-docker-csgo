# CS:GO Cycom Docker

## Utility

We do not use existing CS:GO dockers because they do not complain to the usage we have of it as it downloads csgo at every launch so if we need to launch 6 servers it will download 6 times CS:GO.
Instead we download CS:GO at build time of the docker.
This will allow us to rebuild the docker when there is an update and also to then launch multiple servers without downloading the game multiple times.

## Build the image

In order to build the image you just have to run the build script:

```bash
./build.sh
```

The image is created under the tag `cycom/csgo`

## Launch a server

You just have to run the csgo script by giving the port on which the server will be exposed:

```bash
./csgo port
```
example:
```bash
./csgo 27015
```

On the configuration of the server, the csgo script is placed in a folder, which is in PATH or has been added to PATH, to allow it being executed from anywhere:

```bash
csgo port
```
