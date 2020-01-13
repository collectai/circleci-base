FROM alpine:3

ENV AWS_CLI_VERSION=1.17.0

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

RUN apk add --no-cache \
  curl \
  docker \
  dockerize \
  jq \
  git \
  openssh \
  tar \
  python \
  gcc musl-dev make python-dev libffi-dev openssl-dev \
  py-pip

RUN echo ${AWS_CLI_VERSION}

RUN pip install awscli==${AWS_CLI_VERSION} && aws --version

RUN pip install docker-compose && docker-compose -version

# Add collectai's request tool
ADD request /usr/local/bin/

WORKDIR /build

CMD ["/bin/bash"]
