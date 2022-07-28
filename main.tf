locals {
  git_log    = chomp(file("${path.module}/.git/logs/HEAD"))
  last_line  = regex(".*\\z", local.git_log)
  last_split = split(" ", local.last_line)
  git_hash   = local.last_split[1]
}

output "this" {
  value = local.git_hash
}
/*
output "module" {
  value = module.this.this
}

module "this" {
  source = "github.com/jjno91/terraform-git-trick.git?ref=96f4045b41f4e97cf1ede0c90c4bc70b7cb311a2"
}*/