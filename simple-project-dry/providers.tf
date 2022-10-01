provider "aws" {
  region = var.aws_region
  skip_credentials_validation = var.environment == "local"
  skip_metadata_api_check     = var.environment == "local"
  skip_requesting_account_id  = var.environment == "local"
  s3_use_path_style           = var.environment == "local"

  dynamic "endpoints" {
    for_each = var.environment == "local" ? [0] : [1]
    content {
      apigateway     = var.aws_endpoint
      cloudformation = var.aws_endpoint
      cloudwatch     = var.aws_endpoint
      dynamodb       = var.aws_endpoint
      es             = var.aws_endpoint
      firehose       = var.aws_endpoint
      iam            = var.aws_endpoint
      kinesis        = var.aws_endpoint
      lambda         = var.aws_endpoint
      route53        = var.aws_endpoint
      redshift       = var.aws_endpoint
      s3             = var.aws_endpoint
      secretsmanager = var.aws_endpoint
      ses            = var.aws_endpoint
      sns            = var.aws_endpoint
      sqs            = var.aws_endpoint
      ssm            = var.aws_endpoint
      stepfunctions  = var.aws_endpoint
      sts            = var.aws_endpoint
      ec2            = var.aws_endpoint
    }
  }
}
