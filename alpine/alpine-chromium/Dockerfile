FROM alpine

ADD files/run.sh /
RUN apk add --no-cache chromium mesa-gl mesa-dri-intel && chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
