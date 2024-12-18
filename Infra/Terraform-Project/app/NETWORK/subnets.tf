resource "aws_subnet" "public_subnet_1_project_codegroup_apps" {
  vpc_id                  = aws_vpc.vpc_project_codegroup_apps.id
  cidr_block              = var.cidr_blocks_public_subnet_1_project_codegroup_apps
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_default_region}a"

  tags = {
    Name = "${var.project_codegroup_apps}-public-subnet-1-${var.aws_default_region}a"
  }
}

resource "aws_subnet" "private_subnet_1_project_codegroup_apps" {
  vpc_id                  = aws_vpc.vpc_project_codegroup_apps.id
  cidr_block              = var.cidr_blocks_private_subnet_1_project_codegroup_apps
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_default_region}a"

  tags = {
    Name = "${var.project_codegroup_apps}-private_subnet-1-${var.aws_default_region}a"
  }
}

resource "aws_subnet" "public_subnet_2_project_codegroup_apps" {
  vpc_id                  = aws_vpc.vpc_project_codegroup_apps.id
  cidr_block              = var.cidr_blocks_public_subnet_2_project_codegroup_apps
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_default_region}b"

  tags = {
    Name = "${var.project_codegroup_apps}-public-subnet-2-${var.aws_default_region}b"
  }
}


resource "aws_subnet" "private_subnet_2_project_codegroup_apps" {
  vpc_id                  = aws_vpc.vpc_project_codegroup_apps.id
  cidr_block              = var.cidr_blocks_private_subnet_2_project_codegroup_apps
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_default_region}b"

  tags = {
    Name = "${var.project_codegroup_apps}-private-subnet-2-${var.aws_default_region}b"
  }
}