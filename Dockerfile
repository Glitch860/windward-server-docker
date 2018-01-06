FROM frolvlad/alpine-mono:latest

ENV WINDWARD_SERVER_NAME "Docker Test"
ENV WINDWARD_SERVER_WORLD "testing"
ENV WINDWARD_SERVER_PORT 5127
ENV WINDWARD_ADMINS ""
ENV WINDWARD_PUBLIC 0

RUN apk update && \
    apk add curl

RUN mkdir -p /windward
COPY WWServer.exe run.sh check.sh /windward/
RUN chmod u+x /windward/WWServer.exe && \
    chmod u+x /windward/run.sh && \
    chmod u+x /windward/check.sh

EXPOSE 5127
WORKDIR /windward

ENTRYPOINT /windward/run.sh
HEALTHCHECK CMD /windward/check.sh