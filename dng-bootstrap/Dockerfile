FROM metux/devuan-ascii-micro-amd64

ARG APT_ARGS
ARG CALL_APT="apt-get ${APT_ARGS}"
ARG APT_INSTALL="${CALL_APT} install --no-install-recommends -y"
ARG APT_UPDATE="${CALL_APT} update"

USER root

RUN export DEBIAN_FRONTEND=noninteractive && \
    ${APT_UPDATE} && \
    ${APT_INSTALL} debootstrap debian-keyring && \
    ${CALL_APT} autoremove -y && \
    ${CALL_APT} clean && \
    rm -Rf /var/cache/apt /var/lib/apt/lists

ADD files/run.sh /run.sh
ENTRYPOINT [ "/run.sh" ]
