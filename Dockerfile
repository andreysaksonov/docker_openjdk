FROM alpine:3.7

ARG OPENJDK8_PKG_VER=8.151.12-r0
ARG BASH_PKG_VER=4.4.19-r1
ARG TINI_PKG_VER=0.16.1-r0
ARG SU_EXEC_PKG_VER=0.2-r0
ARG UNZIP_PKG_VER=6.0-r2

RUN { \
    echo '#!/bin/sh'; \
    echo 'set -e'; \
    echo; \
    echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
  } > /usr/local/bin/java_home \
  && chmod +x /usr/local/bin/java_home

ENV LANG=C.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

RUN set -x \
  && apk add --no-cache openjdk8="$OPENJDK8_PKG_VER" \
  && [ "$JAVA_HOME" = "$(java_home)" ]

RUN apk add --no-cache \
    bash="$BASH_PKG_VER" \
    tini="$TINI_PKG_VER" \
    su-exec="$SU_EXEC_PKG_VER" \
    unzip="$UNZIP_PKG_VER"

LABEL version="8u151-16052018" description="OpenJDK Docker Image" source="https://github.com/andreysaksonov/docker_openjdk"

ENTRYPOINT ["/bin/bash"]
