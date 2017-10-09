FROM debian:jessie

ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    libgmp-dev \
    zlib1g-dev

# Install stack 1.5.1
RUN curl -L https://github.com/commercialhaskell/stack/releases/download/v1.5.1/stack-1.5.1-linux-x86_64.tar.gz | tar zx -C /tmp
RUN mv /tmp/stack-1.5.1-linux-x86_64/stack /usr/local/bin

# Install node 8.x
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs && apt-get clean

RUN npm install -g yarn
