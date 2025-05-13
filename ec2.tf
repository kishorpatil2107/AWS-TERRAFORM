# Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

# Default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Security Group
resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "This will add a TF security group"
  vpc_id      = aws_default_vpc.default.id

  # Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Flask app"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Fixed: should be a list
    description = "HTTP open"
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "automate-sg"
  }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  count = 2 # Number of instances to create/meta argument
  ami                    =  var.ec2_ami_id #"ami-04f7a54071e74f488"
  instance_type          = var.ec2_instance_type #"t2.micro"
  key_name               = aws_key_pair.my_key.key_name
  security_groups        = [aws_security_group.my_security_group.name]
  user_data = file("install_nginx.sh")

  root_block_device {
    volume_size = var.ec2_root_storage_size #15
    volume_type = "gp3"
  }

  tags = {
    Name = "automate-instance-${count.index + 1}"
  }
}
