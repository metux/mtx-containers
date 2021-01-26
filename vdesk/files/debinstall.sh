set -e

export DEBIAN_FRONTEND=noninteractive

aptinstall() {
    apt-get install --no-install-recommends -y $@
}

base_install() {
    apt-get update
    apt-get upgrade -y
    aptinstall locales iso-codes $@
    apt-get autoremove -y
    apt-get clean
    locale-gen
}

clean_cache() {
    rm -Rf \
        /usr/share/doc \
        /var/lib/systemd \
        /var/lib/dpkg/*-old \
        /var/lib/apt/lists \
        /var/lib/apt/mirrors \
        /var/lib/apt/periodic \
        /var/mail \
        /var/opt \
        /var/spool \
        /var/backups \
        /var/cache/apt \
        /var/cache/fontconfig/* \
        /var/local \
        /var/opt \
        /boot \
        /media \
        /opt \
        /mnt \
        /root \
        /srv \
        /lib/systemd
}

clean_doc() {
    rm -Rf \
        /usr/share/doc \
        /usr/share/icons/Adwaita \
        /usr/share/info \
        /usr/share/man \
        /usr/share/common-licenses \
        /usr/share/X11/locale/el_GR.UTF-8 \
        /usr/share/libthai \
        /usr/share/lintian \
        /usr/share/bug
}

clean_xprogs() {
    rm -Rf \
        /usr/share/icons/Adwaita \
        /usr/bin/appres \
        /usr/bin/dbus-cleanup-sockets \
        /usr/bin/dbus-uuidgen \
        /usr/bin/debconf-escape \
        /usr/bin/dbus-daemon \
        /usr/bin/deb-systemd-helper \
        /usr/bin/dbus-launch \
        /usr/bin/dbus-monitor \
        /usr/bin/dbus-run-session \
        /usr/bin/dbus-send \
        /usr/bin/dbus-update-activation-environment \
        /usr/bin/editres \
        /usr/bin/gtk-update-icon-cache \
        /usr/bin/kbxutil \
        /usr/bin/xdpyinfo \
        /usr/bin/xev \
        /usr/bin/xfontsel \
        /usr/bin/xlsatoms \
        /usr/bin/xlsfonts \
        /usr/bin/xprop \
        /usr/bin/xwininfo \
        /usr/bin/xdriinfo \
        /usr/bin/xfd \
        /usr/bin/xkill \
        /usr/bin/xlsclients \
        /usr/bin/xmessage \
        /usr/bin/xvinfo \
        /usr/share/polkit-1 \
        /usr/share/menu \
        /usr/share/X11/xkb \
        /usr/share/applications
}


clean_devel() {
    rm -Rf \
       /usr/local \
       /usr/src \
       /usr/share/pkgconfig
}

clean_shell() {
    rm -Rf \
       /usr/share/perl5/Debconf \
       /usr/share/bash-completion
}

clean_all() {
    echo "running cleanup"
    clean_cache
    clean_doc
    clean_xprogs
    clean_devel
    clean_shell
}
