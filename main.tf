module "this" {
  source = "github.com/champ-oss/terraform-git-hash.git?ref=v1.0.1-552fc19"
  path   = path.module
}

output "this" {
  value = module.this.hash
}