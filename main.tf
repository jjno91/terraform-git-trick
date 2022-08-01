variable "fallback" { default = "latest" }
variable "path" { default = null }

locals {
  path             = var.path == null ? path.root : var.path
  git_log_path     = "${local.path}/.git/logs/HEAD"
  git_log_contents = fileexists(local.git_log_path) ? chomp(file(local.git_log_path)) : ""
  last_line        = fileexists(local.git_log_path) ? regex(".*\\z", local.git_log_contents) : ""
  last_line_tokens = fileexists(local.git_log_path) ? split(" ", local.last_line) : []
  hash             = fileexists(local.git_log_path) ? local.last_line_tokens[1] : var.fallback
}

output "hash" {
  value = local.hash
}
/*
output "module" {
  value = module.this.hash
}

module "this" {
  source = "github.com/jjno91/terraform-git-trick.git?ref=0d4519165159221599c0f885a232b1bd23a95d41"
}*/