terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }

  }
}

provider "aws" {
  region = "us-east-1"

}
resource "aws_lightsail_instance" "server1" {
  name              = "server1"
  availability_zone = "us-east-1b"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_1_0"
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && sudo echo '<h1>This Server is created using Terraform </h1>' | sudo tee /var/www/html/index.html"
}