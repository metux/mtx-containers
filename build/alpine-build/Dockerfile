FROM alpine

RUN apk add alpine-sdk sudo git tig coreutils shadow
RUN useradd -m build
USER build
COPY --chown=build:build gitconfig /home/build/.gitconfig
RUN git clone https://gitlab.alpinelinux.org/alpine/aports /home/build/aports
RUN ls -laR /home/build
RUN cat /home/build/.gitconfig
