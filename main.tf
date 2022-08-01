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

output "module" {
  value = module.this.hash
}

output "module2" {
  value = module.this2.hash
}

module "this" {
  source = "github.com/jjno91/terraform-git-trick.git?ref=341135a1f2330497f6aec1eff56ec853f992481a"
  path   = path.module
}

module "this2" {
  source = "github.com/jjno91/terraform-git-trick.git?ref=553825a0ff6c51e42ac9ed90709702919362af83"
  path   = path.module
}

// benign comment