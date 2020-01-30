FROM metux/sles12-base

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

# build geos v38
RUN zypper --non-interactive si geos38
RUN cd /usr/src/packages/SPECS && rpmbuild -ba geos38.spec
RUN cp /usr/src/packages/RPMS/x86_64/*.rpm /usr/src/packages/repo/x86_64
RUN cp /usr/src/packages/SRPMS/*.src.rpm   /usr/src/packages/repo/srpm
RUN createrepo /usr/src/packages/repo

# install geos v38
ADD files/etc/zypp/repos.d/local.repo /etc/zypp/repos.d
RUN zypper refresh
RUN zypper install -y geos38 geos38-devel

RUN zypper install -y postgresql12-devel libxml2-devel bzip2

RUN wget https://download.osgeo.org/postgis/source/postgis-3.0.0.tar.gz
RUN mkdir -p /usr/src/postgis && cd /usr/src/postgis && tar -xzf /postgis-3.0.0.tar.gz

#RUN cd /usr/src/postgis/postgis-3.0.0 && ./configure --with-pgconfig=/usr/pgsql-12/bin/pg_config
