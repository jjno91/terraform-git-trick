locals {
  git_log   = file("${path.module}/.git/logs/HEAD")
  last_line = regex("\n.*\n.*\\z", local.git_log)
  last_list = split(" ", local.last_line)
  git_hash  = local.last_list[1]
}

output "this" {
  value = local.git_hash
}