FROM alpine:3.8

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

RUN apk add --no-cache \
  aws-cli \
  curl \
  docker \
  dockerize \
  jq \
  git \
  tar

# add collectai's request tool
ADD request /usr/local/bin/

WORKDIR /build

CMD ["/bin/bash"]