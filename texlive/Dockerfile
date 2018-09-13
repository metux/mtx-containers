FROM metux/devuan-ascii-micro-amd64

USER root

VOLUME /var/cache/apt

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get -o Acquire::Check-Valid-Until=false install --no-install-recommends -y bash texlive texlive-lang-german texlive-fonts-extra texlive-latex-extra && \
    apt-get -o Acquire::Check-Valid-Until=false autoremove -y

ADD files/run-texlive.sh /

ENTRYPOINT ["/run-texlive.sh"]
