resource "random_string" "main" {
  length  = 60
  special = false
  upper   = false
  numeric = var.unique-include-numbers
}
