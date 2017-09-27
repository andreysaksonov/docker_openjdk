FROM openjdk:8-jdk-alpine
LABEL version="1.0"
LABEL description="OpenJDK Docker Image"
LABEL source="https://github.com/andreysaksonov/docker_openjdk"
RUN apk add --no-cache bash
