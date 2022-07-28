locals {
  git_log_path     = "${path.module}/.git/logs/HEAD"
  git_log_contents = fileexists(local.git_log_path) ? chomp(file(local.git_log_path)) : ""
  last_line        = fileexists(local.git_log_path) ? regex(".*\\z", local.git_log_contents) : ""
  last_split       = fileexists(local.git_log_path) ? split(" ", local.last_line) : []
  git_hash         = fileexists(local.git_log_path) ? local.last_split[1] : "latest"
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