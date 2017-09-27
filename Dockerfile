FROM openjdk:8-jdk-alpine
LABEL version="1.0" description="OpenJDK Docker Image" source="https://github.com/andreysaksonov/docker_openjdk"
RUN apk add --no-cache bash
ENTRYPOINT ["/bin/bash"]
