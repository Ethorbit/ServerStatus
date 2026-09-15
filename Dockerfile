FROM alpine:3.24.1 AS app
ARG UNAME="server-status"
ARG GNAME="server-status"
ARG UID=1000
ARG GID=1000
WORKDIR /server-status
COPY dist/ServerStatus-linux .
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
RUN addgroup -g ${GID} "${GNAME}"
RUN adduser -D -u ${UID} -G "${GNAME}" "${UNAME}" &&\
    chown "${UNAME}":"${GNAME}" -R /server-status/
USER ${UNAME}
ENTRYPOINT ./ServerStatus-linux

FROM golang:alpine3.24 AS builder
RUN apk add --no-cache git alpine-sdk
