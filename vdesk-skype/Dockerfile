FROM metux/devuan-ascii-micro-amd64

#ARG APT_ARGS="-o Debug::Acquire::http=true"
ARG APT_ARGS

ARG CALL_APT="apt-get ${APT_ARGS}"
ARG APT_INSTALL="${CALL_APT} install --no-install-recommends -y"
ARG APT_UPDATE="${CALL_APT} update"

USER root

ADD files/entrypoint.sh                         /
ADD files/etc/apt/skype-repo.key                /etc/apt
ADD files/etc/apt/preferences.d/skypeforlinux   /etc/apt/preferences.d/

## fixme: install fake apt-transport-https after skype

RUN export DEBIAN_FRONTEND=noninteractive && \
    ${APT_UPDATE} && \
    ${APT_INSTALL} ca-certificates apt-transport-https strace pulseaudio pulseaudio-utils && \
    echo "deb https://repo.skype.com/deb stable main" > /etc/apt/sources.list.d/skype-stable.list && \
    apt-key add /etc/apt/skype-repo.key && \
    ${APT_UPDATE} && \
    ${APT_INSTALL} skypeforlinux && \
    apt-mark auto apt-transport-https && \
    ${CALL_APT} autoremove -y && \
    ${CALL_APT} clean && \
    rm -Rf /var/cache/apt /var/lib/apt/lists

# need to be after apt run, as we're overwriting package files
ADD files/etc/asound.conf                       /etc/asound.conf
ADD files/etc/pulse/client.conf                 /etc/pulse/client.conf

#RUN export DEBIAN_FRONTEND=noninteractive && \
#    ${APT_UPDATE} && \
#    ${APT_INSTALL} elogind

#RUN export DEBIAN_FRONTEND=noninteractive && \
#    ${APT_UPDATE} && \
#    ${APT_INSTALL} gosu

#RUN export DEBIAN_FRONTEND=noninteractive && \
#    ${APT_UPDATE} && \
#    ${APT_INSTALL} libasound2-plugins


ENTRYPOINT ["/entrypoint.sh"]
