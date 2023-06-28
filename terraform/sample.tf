terraform {
  backend "local" {}
}

provider "aws" {
  region = "ap-northeast-1"
  access_key = "foo"
  secret_key = "bar"

  s3_use_path_style = true
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true

  endpoints {
    s3 = "http://localstack_main:4566"
  }
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "test-bucket"
}
