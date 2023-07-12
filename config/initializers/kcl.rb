# frozen_string_literal: true

require 'kcl'

ENV["KINESIS_STREAM_NAME"] = "kcl-hands-on"
ENV["KCL_WORKER_NAME"] = "kcl-hands-on"

Kcl.configure do |config|
  config.aws_region = 'us-east-1'
  config.aws_access_key_id = 'dummy'
  config.aws_secret_access_key = 'dummy'
  config.dynamodb_table_name = ENV['KINESIS_STREAM_NAME']
  config.kinesis_stream_name = ENV['KINESIS_STREAM_NAME']
  config.dynamodb_endpoint = 'https://localhost:4566'
  config.kinesis_endpoint = 'https://localhost:4566'
  config.use_ssl = Rails.env.production?
  config.logger = Rails.logger
end
