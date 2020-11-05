#! /bin/sh
#
# Automate naming the image for a SteamCMD Docker server

GAME=`grep 'ENV USER ' Dockerfile | perl -pe 's/(?:ENV USER )(\w*)/$1/'`
VERSION=`grep 'LABEL version=' Dockerfile | perl -pe 's/(?:LABEL version=")(.*)"/$1/'`
IMG=Cycom/${GAME}:${VERSION}

docker build --rm -t ${IMG} .
