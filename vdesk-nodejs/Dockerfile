FROM debian

#ARG APT_ARGS="-o Debug::Acquire::http=true"
ARG APT_ARGS

ARG CALL_APT="apt-get ${APT_ARGS}"
ARG APT_INSTALL="${CALL_APT} install --no-install-recommends -y"
ARG APT_UPDATE="${CALL_APT} update"

USER root

#VOLUME /var/cache/apt
#VOLUME /var/lib/apt/lists

#ADD files/entrypoint.sh                         /
#ADD files/wait.sh                               /
#ADD files/etc/apt/skype-repo.key                /etc/apt
#ADD files/etc/apt/preferences.d/skypeforlinux   /etc/apt/preferences.d/

## fixme: install fake apt-transport-https after skype

RUN export DEBIAN_FRONTEND=noninteractive && \
    ${APT_UPDATE} && \
    ${APT_INSTALL} npm cmake make mc bash git g++

#    ${CALL_APT} autoremove -y && \
#    ${CALL_APT} clean && \
#    rm -Rf /var/cache/apt /var/lib/apt/lists

#RUN export DEBIAN_FRONTEND=noninteractive && \
#    ${APT_UPDATE} && \
#    ${APT_INSTALL} bash

ADD files/wait.sh /

#RUN export DEBIAN_FRONTEND=noninteractive && \
#    ${APT_UPDATE} && \
#    ${APT_INSTALL} cmake make mc

RUN chmod +x /wait.sh

ENTRYPOINT ["/wait.sh"]
#ENTRYPOINT ["/entrypoint.sh"]
