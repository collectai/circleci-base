FROM circleci/node:6.10

RUN sudo apt-get update && \
    sudo apt-get install python-dev && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/tmp/awscli-bundle.zip" && \
    unzip /tmp/awscli-bundle.zip -d /tmp && \
    sudo ./tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    sudo rm -rf /var/lib/apt/lists/* && \
    sudo rm -rf /tmp/*