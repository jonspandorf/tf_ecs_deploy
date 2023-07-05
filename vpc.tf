# Providing a reference to our default VPC
resource "aws_default_vpc" "def" {
}

# Providing a reference to our default subnets
resource "aws_default_subnet" "def_a" {
  availability_zone = "us-east-1a"
}

resource "aws_default_subnet" "def_b" {
  availability_zone = "us-east-1a"
}

resource "aws_default_subnet" "def_c" {
  availability_zone = "us-east-1a"
}