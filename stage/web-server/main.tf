terraform {
  required_version = ">= 1.0.0"
    backend "s3" {
       # Replace this with your bucket name!
      bucket = "<YOUR_S3_BUCKET_HERE>"
      key = "stage/web-server/terraform.tfstate"
      region= "us-east-2"
      # Replace this with your DynamoDB table name!
      dynamodb_table = "YOUR_DYNAMODB_TABLE_NAME_HERE"
      encrypt        = true
     }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {

  name = var.security_group_name

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

