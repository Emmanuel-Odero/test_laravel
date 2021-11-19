FROM gitpod/workspace/test_laravel

ENV GIT_SSL_NO_VERIFY=true

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
RUN sudo apt-get update && sudo apt-get purge -y \
         docker-ce \
         docker-ce-cli \
         containerd.io && \ 
    sudo apt-get upgrade -y && \
    sudo apt-get install -y \
         docker-ce=5:19.03.15~3-0~ubuntu-focal \
         docker-ce-cli=5:19.03.15~3-0~ubuntu-focal && \
    sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* && \
    sudo curl -fsSL -o /usr/bin/runc https://github.com/opencontainers/runc/releases/download/v1.0.0-rc93/runc.amd64

RUN sudo apt-get install apt-transport-https ca-certificates -y &&\
    sudo update-ca-certificates
