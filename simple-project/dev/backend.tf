terraform {
  backend "s3" {
    bucket = "rshnaper-terraform"
    key    = "dev/simple-project/terraform.tfstate"
    region = "ca-central-1"
  }
}
