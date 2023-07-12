provider "aws" {
  version                     = "~> 2.60"
  access_key                  = "dummy"
  secret_key                  = "dummy"
  region                      = "us-east-1"
  insecure                    = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    dynamodb = "https://localhost:4566"
    kinesis  = "https://localhost:4566"
  }
}


resource "aws_kinesis_stream" "kcl-rb-demo_stream" {
  name             = "kcl-hands-on"
  shard_count      = 5
  retention_period = 24

  tags = {
    Environment = "test"
  }
}
