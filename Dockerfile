FROM archlinux

WORKDIR /usr/src/steam
RUN pacman --noconfirm -Syu lib32-glibc curl && \
    curl https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xvz &&\
    ./steamcmd.sh +login anonymous +force_install_dir ./cs_go/ +app_update 740 validate +quit
