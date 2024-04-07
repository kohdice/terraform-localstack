ARG GO_VERSION=1.22

FROM golang:${GO_VERSION}-bullseye

ARG TERRAFORM_VERSION=1.7.5

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  neovim \
  unzip \
  && curl -OL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_arm64.zip \
  && chmod +x terraform \
  && mv terraform /usr/bin \
  && rm -rf terraform_${TERRAFORM_VERSION}_linux_arm64.zip \
  && curl https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip -o awscliv2.zip \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf awscliv2.zip aws \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
