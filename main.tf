module "this" {
  source = "github.com/jjno91/terraform-git-trick.git?ref=c3fa539e4d862732ee0401299ce5d3b6c972d2eb"
}

output "this" {
  value = module.this.this
}