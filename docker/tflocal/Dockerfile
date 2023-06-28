FROM python:3.11-bullseye

ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/workspace
ENV LOCALSTACK_HOSTNAME=localstack \
    S3_HOSTNAME=localstack \
    TF_VAR_s3_use_path_style=true \
    AWS_DEFAULT_REGION=ap-northeast-1

RUN apt-get update && apt-get install -y jq neovim gnupg software-properties-common unzip \
    && curl -OL https://releases.hashicorp.com/terraform/1.5.1/terraform_1.5.1_linux_arm64.zip \
    && unzip terraform_1.5.1_linux_arm64.zip \
    && chmod +x terraform \
    && mv terraform /usr/bin \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
    && pip install terraform-local

WORKDIR /workspace
