locals {
  git_log    = file("${path.module}/.git/logs/HEAD")
  last_line  = regex("\n.*\n.*\\z", local.git_log)
  last_split = split(" ", local.last_line)
  git_hash   = local.last_split[1]
}

output "this" {
  value = local.git_hash
}