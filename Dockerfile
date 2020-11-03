FROM alpine

WORKDIR /usr/src/steam
RUN echo "x86" > /etc/apk/arch
RUN apk add bash libc-utils libc-dev
RUN wget -O - https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xvz
RUN ./steamcmd.sh +login anonymous +force_install ./cs_go/ +app_update 740 validate +quit
