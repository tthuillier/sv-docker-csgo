FROM archlinux

LABEL version="2020-11-04"
LABEL organization="@cycom"
LABEL maintainers="@wrexes, @breigner01"

ENV USER csgo
ENV HOME /home/$USER
ENV SERVER $HOME/hlserver

RUN pacman --noconfirm -Syuu curl lib32-glibc net-tools tree \
    && pacman --noconfirm -Sc \
    && useradd ${USER} \
    && mkdir ${HOME} \
    && chown ${USER}:${USER} ${HOME} \
    && mkdir ${SERVER}

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ADD ./autoexec.cfg ${SERVER}/csgo/csgo/cfg/autoexec.cfg
ADD ./server.cfg ${SERVER}/csgo/csgo/cfg/server.cfg
ADD ./srcds.txt ${SERVER}/srcds.txt

RUN chown -R ${USER}:${USER} ${SERVER}

USER ${USER}
RUN curl https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -C ${SERVER} -xz \
    && cd ${SERVER} \
    && ./steamcmd.sh +runscript ./srcds.txt

EXPOSE 27015/udp

WORKDIR ${SERVER}/${USER}
ENTRYPOINT [ "./srcds_run" ]
CMD [                                   \
    "-steamcmd_script", "./srcds.txt",  \
    "-game", "csgo",                    \
    "-tickrate", "128",                 \
    "-autoupdate",                      \
    "-steam_dir", "${SERVER}",          \
    "-console",                         \
    "-usercon",                         \
    "+game_type", "0",                  \
    "+game_mode", "1",                  \
    "+mapgroup", "mg_active",           \
    "+map", "de_cache"                  \
    ]
