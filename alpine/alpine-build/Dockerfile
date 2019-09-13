FROM alpine
RUN apk update
RUN apk add bash abuild chromium
RUN apk add build-base xdg-utils eudev-libs ttf-opensans alsa-lib-dev bash bison flex bsd-compat-headers bzip2-dev cairo-dev clang-dev curl-dev dbus-glib-dev elfutils elfutils-dev eudev-dev ffmpeg-dev findutils flac-dev freetype-dev gnutls-dev gperf gtk+3.0-dev gzip harfbuzz-dev hunspell-dev hwids-usb jpeg-dev jsoncpp-dev krb5-dev lcms2-dev libbsd-dev libcap-dev libevent-dev libexif-dev libgcrypt-dev libgnome-keyring-dev libjpeg-turbo-dev libpng-dev libusb-dev libva-dev libwebp-dev libxcomposite-dev libxcursor-dev libxinerama-dev libxml2-dev libxrandr-dev libxscrnsaver-dev libxslt-dev linux-headers lld mesa-dev minizip-dev ninja nodejs nss-dev java-jdk opus-dev pciutils-dev perl python3 re2-dev snappy-dev speex-dev sqlite-dev xcb-proto zlib-dev py2-setuptools
RUN adduser builder --disabled-password --gecos ""
RUN addgroup builder abuild 
RUN mkdir -p /var/cache/distfiles
RUN chmod a+w /var/cache/distfiles
RUN chgrp abuild /var/cache/distfiles
RUN chmod g+w /var/cache/distfiles
RUN su builder -c 'abuild-keygen -a -n'
CMD ["/sbin/init"]
