FROM alpine:edge

ENV LANG=C.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin \
    OPENJDK8_PACKAGE_VERSION=8.151.12-r0 \
    BASH_PACKAGE_VERSION=4.4.12-r1

RUN { \
    echo '#!/bin/sh'; \
    echo 'set -e'; \
    echo; \
    echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
  } > /usr/local/bin/java_home \
  && chmod +x /usr/local/bin/java_home \
  && set -x \
  && apk add --no-cache openjdk8="$OPENJDK8_PACKAGE_VERSION" \
  && apk add --no-cache bash="$BASH_PACKAGE_VERSION" \
  && [ "$JAVA_HOME" = "$(java_home)" ]

LABEL version="1.1" description="OpenJDK Docker Image" source="https://github.com/andreysaksonov/docker_openjdk"

ENTRYPOINT ["/bin/bash"]
