provider "aws"  {
    region = "us-east-2"
    
}

# Create a VPC
resource "aws_vpc" "my-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name: "development"

    }  
}
#comment 12
#Creating a variable 
variable "subnet_cidr_block" {
    description = "subnet cidr block"
  
}

variable "vpc_cidr_block" {
    description = "vpc cidr block"
  
}



#create a Subnet
resource "aws_subnet" "my-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = "us-east-2a"
    tags = {
        Name: "subnet-1-dev"
        vpc_env: "dev"

    }
  
}

data "aws_vpc" "existing_vpc" {
    default = true
  
}

#create a Subnet
resource "aws_subnet" "my-subnet-1" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.48.0/20"
    availability_zone = "us-east-2a"
    tags = {
        Name: "subnet-1-default"
        
         }
}    