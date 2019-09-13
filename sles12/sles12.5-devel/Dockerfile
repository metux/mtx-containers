FROM metux/sles12.5-eval

## base setup
RUN SUSEConnect -r 31E0CB2B91C734 && \
    SUSEConnect -p sle-sdk/12.5/x86_64 && \
    zypper remove -y -u kernel-default grub2 plymouth-plugin-label plymouth-plugin-script && \
    zypper update -y && \
    zypper install -y wget mc gcc rpmbuild git bzip2 createrepo

RUN mkdir -p /usr/src/packages/repo/x86_64 \
             /usr/src/packages/repo/srpm

RUN createrepo /usr/src/packages/repo

ADD files/etc/zypp/repos.d/local.repo /etc/zypp/repos.d

RUN zypper refresh

CMD [ "/sbin/init" ]
