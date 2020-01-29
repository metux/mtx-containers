FROM metux/sles12

## base setup
RUN SUSEConnect -r 31E0CB2B91C734
RUN SUSEConnect -p sle-sdk/12.5/x86_64
RUN zypper remove -y -u kernel-default grub2 plymouth-plugin-label plymouth-plugin-script
RUN zypper update -y
RUN zypper install -y wget mc gcc rpmbuild git bzip2 createrepo

## postgresql12-base / dev
ADD files/etc/zypp/repos.d/pgdg-12.repo      /etc/zypp/repos.d/pgdg-12.repo
ADD files/etc/zypp/repos.d/pgdg-12-srpm.repo /etc/zypp/repos.d/pgdg-12-srpm.repo

RUN wget https://download.postgresql.org/pub/repos/zypp/12/suse/sles-12.4-x86_64/repodata/repomd.xml.key && rpm --import repomd.xml.key && rm -f repomd.xml.key
RUN wget https://download.postgresql.org/pub/repos/zypp/srpms/12/suse/sles-12-x86_64/repodata/repomd.xml.key && rpm --import repomd.xml.key && rm -f repomd.xml.key
