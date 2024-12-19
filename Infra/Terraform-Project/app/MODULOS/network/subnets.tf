resource "aws_subnet" "public_subnet_1_modulo_project_codegroup_apps" {
  vpc_id                  = aws_vpc.vpc_modulo_project_codegroup_apps.id
  cidr_block              = var.cidr_blocks_public_subnet_1_project_codegroup_apps
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_default_region}a"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_codegroup_apps_name}-public-subnet-1-${var.aws_default_region}a-${var.environment_codegroup_apps}"
      Projeto = "${var.project_codegroup_apps}"
      Environment = "${var.environment_codegroup_apps}"
    }
  )
}

resource "aws_subnet" "private_subnet_1_modulo_project_codegroup_apps" {
  vpc_id                  = aws_vpc.vpc_modulo_project_codegroup_apps.id
  cidr_block              = var.cidr_blocks_private_subnet_1_project_codegroup_apps
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_default_region}a"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_codegroup_apps_name}-public-subnet-1-${var.aws_default_region}a-${var.environment_codegroup_apps}"
      Projeto = "${var.project_codegroup_apps}"
      Environment = "${var.environment_codegroup_apps}"
    }
  )
}

resource "aws_subnet" "public_subnet_2_modulo_project_codegroup_apps" {
  vpc_id                  = aws_vpc.vpc_modulo_project_codegroup_apps.id
  cidr_block              = var.cidr_blocks_public_subnet_2_project_codegroup_apps
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_default_region}b"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_codegroup_apps_name}-public-subnet-1-${var.aws_default_region}a-${var.environment_codegroup_apps}"
      Projeto = "${var.project_codegroup_apps}"
      Environment = "${var.environment_codegroup_apps}"
    }
  )
}


resource "aws_subnet" "private_subnet_2_modulo_project_codegroup_apps" {
  vpc_id                  = aws_vpc.vpc_modulo_project_codegroup_apps.id
  cidr_block              = var.cidr_blocks_private_subnet_2_project_codegroup_apps
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_default_region}b"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_codegroup_apps_name}-public-subnet-1-${var.aws_default_region}a-${var.environment_codegroup_apps}"
      Projeto = "${var.project_codegroup_apps}"
      Environment = "${var.environment_codegroup_apps}"
    }
  )
}