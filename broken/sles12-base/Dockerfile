FROM metux/sles12.5-eval

## base setup
RUN SUSEConnect -r 31E0CB2B91C734 && \
    SUSEConnect -p sle-sdk/12.5/x86_64 && \
    zypper remove -y -u kernel-default grub2 plymouth-plugin-label plymouth-plugin-script && \
    zypper update -y && \
    zypper install -y wget mc gcc rpmbuild git bzip2 createrepo

## postgresql12-base / dev
ADD files/etc/zypp/repos.d/pgdg-12.repo      /etc/zypp/repos.d/pgdg-12.repo
ADD files/etc/zypp/repos.d/pgdg-12-srpm.repo /etc/zypp/repos.d/pgdg-12-srpm.repo

RUN wget https://download.postgresql.org/pub/repos/zypp/12/suse/sles-12.4-x86_64/repodata/repomd.xml.key && \
    rpm --import repomd.xml.key && \
    rm -f repomd.xml.key && \
    wget https://download.postgresql.org/pub/repos/zypp/srpms/12/suse/sles-12-x86_64/repodata/repomd.xml.key && \
    rpm --import repomd.xml.key && \
    rm -f repomd.xml.key && \
    zypper refresh

RUN mkdir -p /usr/src/packages/repo/x86_64 \
             /usr/src/packages/repo/srpm

CMD [ "/sbin/init" ]
