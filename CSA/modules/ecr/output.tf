output "repository_urls" {
  description = "The URLs of the created ECR repositories"
  value       = [for repo in aws_ecr_repository.this : repo.repository_url]
}

output "repository_arns" {
  description = "The ARNs of the created ECR repositories"
  value       = [for repo in aws_ecr_repository.this : repo.arn]
}
