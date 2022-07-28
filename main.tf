data "git_repository" "this" {
  path = path.module
}

output "root" {
  value = data.git_repository.this.commit_sha
}

output "module" {
  value = module.this.commit_sha
}

module "this" {
  source = "github.com/jjno91/terraform-git-trick?ref=194a1b53bbf7147718258be5b9a7794b471da6a1"
}

terraform {
  required_providers {
    git = {
      source  = "innovationnorway/git"
      version = "0.1.3"
    }
  }
}