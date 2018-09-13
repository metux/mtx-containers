FROM alpine:3.8

RUN apk add --no-cache bash texlive

ADD files/run-texlive.sh /

ENTRYPOINT ["/run-texlive.sh"]
