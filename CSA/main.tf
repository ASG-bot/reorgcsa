module "vpc" {
  source = "./modules/vpc"

  name     = "my-vpc"
  vpc_cidr = "10.0.0.0/16"
  azs      = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  security_groups = {
    "ecs-sg" = {
      description = "Security group for ecs"
      ingress = [
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        },
        {
          from_port   = 443
          to_port     = 443
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  }
}

output "security_group_ids" {
  description = "The IDs of the created security groups"
  value       = module.security_groups.security_group_ids["ecs-sg"]
}

module "ecs" {
  source = "./modules/ecs"

  cluster_name      = "my-ecs-cluster"
  service_name      = "my-ecs-service"
  subnet_ids        = module.vpc.public_subnets
  security_group_id = module.security_groups.security_group_ids["ecs-sg"]

  container_definitions = [
    {
      name           = "api-container"
      image          = "api-app:latest"
      container_port = 80
    }
  ]
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "your-bucket-name"
  tags        = {}
}

module "lambda" {
  source = "./modules/lambda"

  function_name  = "aws-lambda-funtion"
  handler        = "lambda_funtion.lambda_handler"
  runtime        = "python3.8"
  source_file    = "./aws-lambda/handler.py"
  s3_bucket_name = "your-bucket-name"
}

module "ecr_repositories" {
  source = "./ecr-module"

  repository_names    = ["api", "aws-lambda"]
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
  tags                 = {}
}
