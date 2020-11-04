FROM alpine

WORKDIR /usr/src/steam
RUN echo "x86" > /etc/apk/arch &&\
    apk add --no-cache bash libc-utils libc-dev && \
    wget -O - https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xvz &&\
    ./steamcmd.sh +login anonymous +force_install ./cs_go/ +app_update 740 validate +quit
