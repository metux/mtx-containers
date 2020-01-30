#!/bin/bash

PKG_DIR="$HOME/rpmbuild"
TARBALL_FILE="${PKG_DIR}/SOURCES/${RPM_NAME}-${SRC_VERSION}.tar.gz"
TARGET_DIR="sles12.5-pgbuild/files/src"

set -e

rm -Rf "${PKG_DIR}"
mkdir -p "${PKG_DIR}/SOURCES" "${PKG_DIR}/SPECS"

( cd "${GIT_DIR}" && git archive --format tar --prefix "${RPM_NAME}-${SRC_VERSION}/" HEAD ) | gzip > "${TARBALL_FILE}"
cp "${GIT_DIR}/${RPM_NAME}.spec" "${PKG_DIR}/SPECS"

( cd "${GIT_DIR}" && rpmbuild -bs "${RPM_NAME}.spec" )

mkdir -p ${TARGET_DIR}
cp "${PKG_DIR}/SRPMS/${RPM_NAME}-$RPM_VERSION.src.rpm" ${TARGET_DIR}
