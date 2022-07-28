output "this" {
  value = chomp(file("${path.module}/.git/logs/HEAD"))
}