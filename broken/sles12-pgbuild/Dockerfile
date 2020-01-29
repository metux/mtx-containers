FROM metux/sles12-base

RUN zypper install -y postgresql12-devel libxml2-devel bzip2

RUN zypper --non-interactive si geos38
RUN cd /usr/src/packages/SPECS && rpmbuild -ba geos38.spec

RUN mkdir -p /usr/src/packages/repo/x86_64 /usr/src/packages/repo/srpm
RUN cp /usr/src/packages/RPMS/x86_64/*.rpm /usr/src/packages/repo/x86_64
RUN cp /usr/src/packages/SRPMS/*.src.rpm   /usr/src/packages/repo/srpm

RUN zypper install -y createrepo

RUN createrepo /usr/src/packages/repo

#RUN wget https://download.osgeo.org/postgis/source/postgis-3.0.0.tar.gz
#RUN mkdir -p /usr/src/postgis && cd /usr/src/postgis && tar -xzf /postgis-3.0.0.tar.gz
#RUN cd /usr/src/postgis/postgis-3.0.0 && ./configure --with-pgconfig=/usr/pgsql-12/bin/pg_config

# first need to package geos38

#ENTRYPOINT ["/run.sh"]
