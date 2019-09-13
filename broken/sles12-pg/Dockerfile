FROM sles12

RUN SUSEConnect -r 31E0CB2B91C734
RUN zypper update -y && zypper install -y wget

ADD files/etc/zypp/repos.d/pgdg-12.repo      /etc/zypp/repos.d/pgdg-12.repo
ADD files/etc/zypp/repos.d/pgdg-12-srpm.repo /etc/zypp/repos.d/pgdg-12-srpm.repo

RUN wget https://download.postgresql.org/pub/repos/zypp/12/suse/sles-12.4-x86_64/repodata/repomd.xml.key && rpm --import repomd.xml.key && rm -f repomd.xml.key
RUN wget https://download.postgresql.org/pub/repos/zypp/srpms/12/suse/sles-12-x86_64/repodata/repomd.xml.key && rpm --import repomd.xml.key && rm -f repomd.xml.key

RUN zypper install -y postgresql12-server

RUN wget https://download.osgeo.org/postgis/source/postgis-3.0.0.tar.gz

#RUN zypper search postgres | grep dev
#RUN zypper install -y postgresql12-devel

RUN SUSEConnect -p sle-sdk/12.5/x86_64
RUN zypper install -y postgresql12-devel mc gcc libxml2-devel
RUN mkdir -p /usr/src/postgis && cd /usr/src/postgis && tar -xzf /postgis-3.0.0.tar.gz
RUN cd /usr/src/postgis/postgis-3.0.0 && ./configure --with-pgconfig=/usr/pgsql-12/bin/pg_config
RUN zypper install -y bzip2

# first need to package geos38

RUN zypper si -y geos38

#ENTRYPOINT ["/run.sh"]
