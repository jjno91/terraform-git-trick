locals {
  git_log    = chomp(file("${path.module}/.git/logs/HEAD"))
  last_line  = regex(".*\\z", local.git_log)
  last_split = split(" ", local.last_line)
  git_hash   = local.last_split[1]
}

output "this" {
  value = local.git_hash
}

output "module" {
  value = module.this.this
}

module "this" {
  source = "github.com/jjno91/terraform-git-trick.git?ref=0d4519165159221599c0f885a232b1bd23a95d41"
}