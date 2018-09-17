FROM ubuntu:18.04

# basic build tools & python
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gzip \
    python3 \
    python3-pip \
    software-properties-common \
    tar

# awscli
RUN pip3 install awscli --upgrade --user
ENV PATH="~/.local/bin:${PATH}"

# docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" \
    && apt-get update && apt-get install -y docker-ce

# git
RUN add-apt-repository ppa:git-core/ppa && apt-get update && apt-get install -y git

# jq
RUN JQ_URL="https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64" \
    && curl --silent --show-error --location --fail --retry 3 --output /usr/bin/jq $JQ_URL \
    && chmod +x /usr/bin/jq \
    jq --version

# dockerize
RUN DOCKERIZE_URL="https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz" \
    && curl --silent --show-error --location --fail --retry 3 --output /tmp/dockerize-linux-amd64.tar.gz $DOCKERIZE_URL \
    && tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64.tar.gz \
    && rm -rf /tmp/dockerize-linux-amd64.tar.gz \
    && dockerize --version

# cleanup
RUN rm -rf /var/lib/apt/lists/*

# circleci user setup
# TODO
# RUN groupadd --gid 3434 circleci \
#     && useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci \
#     && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci \
#     && echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep

# USER circleci

WORKDIR /build

CMD ["/bin/bash"]
