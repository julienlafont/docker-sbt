#
# SBT image based on Oracle JRE 8
#

FROM 1science/java:oracle-jre-8
MAINTAINER Julien L

ENV SBT_VERSION 0.13.15
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

# Install sbt & git
RUN curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built && \
    apk update && apk upgrade && \
    apk add --no-cache bash git openssh

WORKDIR /app
