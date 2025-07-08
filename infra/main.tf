resource "aws_instance" "flask_server" {
  ami           = "ami-0f5ee92e2d63afc18"  # Ubuntu 22.04 Mumbai
  instance_type = "t2.micro"
  key_name      = "my-keypair" # replace with your AWS Key Pair name

  vpc_security_group_ids = [aws_security_group.allow_traffic.id]

  user_data = <<-EOF
                #!/bin/bash
                apt update -y
                apt install docker.io -y
                systemctl start docker
                systemctl enable docker
              EOF

  tags = {
    Name = "DockerFlaskEC2"
  }
}

resource "aws_security_group" "allow_traffic" {
  name = "allow-traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
