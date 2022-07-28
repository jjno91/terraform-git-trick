data "git_repository" "this" {
  path = path.module
}

output "this" {
  value = data.git_repository.this.commit_sha
}

terraform {
  required_providers {
    git = {
      source  = "innovationnorway/git"
      version = "0.1.3"
    }
  }
}