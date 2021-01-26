FROM metux/sles12.5-devel

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

# build geos v38 (src from pg repo, dont have binary)
RUN zypper --non-interactive si geos38
RUN cd /usr/src/packages/SPECS && rpmbuild -ba geos38.spec
RUN cp /usr/src/packages/RPMS/x86_64/*.rpm /usr/src/packages/repo/x86_64
RUN cp /usr/src/packages/SRPMS/*.src.rpm   /usr/src/packages/repo/srpm
RUN createrepo /usr/src/packages/repo

# install geos v38
# fixme: install postgresql12-devel later
RUN zypper install -y postgresql12-devel libxml2-devel geos38-devel

RUN wget https://download.osgeo.org/postgis/source/postgis-3.0.0.tar.gz
RUN mkdir -p /usr/src/postgis && cd /usr/src/postgis && tar -xzf /postgis-3.0.0.tar.gz

# build proj62 (src from pg repo, dont have binary)
# missing dep: sqlite3
RUN zypper --non-interactive install -y sqlite3
RUN zypper --non-interactive si proj62
RUN cd /usr/src/packages/SPECS && rpmbuild -ba proj62.spec
RUN cp /usr/src/packages/RPMS/x86_64/*.rpm /usr/src/packages/repo/x86_64
RUN cp /usr/src/packages/SRPMS/*.src.rpm   /usr/src/packages/repo/srpm
RUN createrepo /usr/src/packages/repo

COPY files/rebuild-src-rpm /

## FIXME: copying one by one just for reuising image layers
COPY files/src/bison*.src.rpm      /usr/src/packages/repo/srpm/
RUN createrepo /usr/src/packages/repo
RUN /rebuild-src-rpm bison

RUN touch /1
COPY files/src/libdap*.src.rpm     /usr/src/packages/repo/srpm/
RUN createrepo /usr/src/packages/repo
RUN /rebuild-src-rpm libdap

RUN /rebuild-src-rpm libgeotiff15
#RUN /rebuild-src-rpm libspatialite50

COPY files/src/gdal30*.src.rpm     /usr/src/packages/repo/srpm/
RUN createrepo /usr/src/packages/repo
#RUN /rebuild-src-rpm gdal30

RUN zypper --non-interactive install libdap-devel

### WASHERE

#RUN cd /usr/src/postgis/postgis-3.0.0 && \
#        ./configure --with-pgconfig=/usr/pgsql-12/bin/pg_config \
#                    --with-geosconfig=/usr/geos38/bin/geos-config \
#                    --with-projdir=/usr/proj62
