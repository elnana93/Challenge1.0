

resource "aws_eip" "nat" {
  domain = "vpc"
  # instance = ""

}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-eu-central-1a.id

  tags = {
    Name = "nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}




# resource "aws_eip" "nat" {
#   instance = aws_instance.nat.id
#   vpc      = true
# }

