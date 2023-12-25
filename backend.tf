terraform {
  backend "s3" {
    bucket = "bucketerra"
    key    = "terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "dynamo_terraform"
  }
}
