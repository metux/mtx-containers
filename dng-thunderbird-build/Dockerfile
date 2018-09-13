FROM metux/devuan-ascii-micro-amd64

ARG APT_ARGS
ARG CALL_APT="apt-get ${APT_ARGS}"
ARG APT_INSTALL="${CALL_APT} install --no-install-recommends -y"
ARG APT_UPDATE="${CALL_APT} update"
ARG SCRIPT_DIR="/scripts"

USER root

ADD files/scripts ${SCRIPT_DIR}
ADD files/env.sh  /

RUN export DEBIAN_FRONTEND=noninteractive && \
    ${APT_UPDATE} && \
    ${APT_INSTALL} ca-certificates strace gdb mercurial apt-file make gcc g++ pkg-config \
                   libpulse-dev curl libpango1.0-dev unzip zip autoconf2.13 libgtk-3-dev \
                   libgtk2.0-dev libgconf2-dev libdbus-glib-1-dev yasm libxt-dev clang-3.9 \
                   llvm-3.9-dev && \
    ${CALL_APT} autoremove -y && \
    ${CALL_APT} clean && \
    rm -Rf /var/cache/apt /var/lib/apt/lists

## moz seems too dumb to find llvm
RUN ln -s /usr/bin/llvm-config-3.9 /usr/bin/llvm-config

# install new nodejs
RUN curl https://deb.nodesource.com/setup_8.x | bash -
RUN ${APT_UPDATE} && ${APT_INSTALL} nodejs

# install rust+fiends
RUN ${SCRIPT_DIR}/setup-rustup -y
RUN /root/.cargo/bin/cargo install cbindgen

## install stable toolchain
RUN /root/.cargo/bin/rustup install stable
RUN /root/.cargo/bin/rustup default stable

ENV CLANG_PATH=/usr/bin/clang
ENV MOZ_CLANG_PATH=/usr/bin/clang

RUN curl https://raw.githubusercontent.com/felipec/git-remote-hg/master/git-remote-hg > /usr/bin/git-remote-hg && chmod +x /usr/bin/git-remote-hg

# export CLANG_PATH=/usr/bin/clang
# export MOZ_CLANG_PATH=/usr/bin/clang

CMD ["/sbin/init"]
