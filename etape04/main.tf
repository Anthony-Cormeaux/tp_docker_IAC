# aws ec2 describe-images \
#     --owners 099720109477 \
#     --filters "Name=name,Values=*ubuntu*24.04*amd64-server-*" "Name=state,Values=available" \
#     --query 'sort_by(Images, &CreationDate)[-1].[ImageId,Name]' \
#     --output text \
#     --region eu-west-3


# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0f209d0bb2c44ea6c"
  key_name      = "myKey"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-101-Instance"
  }
}

# Output the public IP of the EC2 instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
