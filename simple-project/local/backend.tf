terraform {
  backend "s3" {
    bucket = "rshnaper-terraform"
    key    = "local/simple-project/terraform.tfstate"
    region = "ca-central-1"
    endpoint = "http://localhost:4566"
    force_path_style = true
  }
}
