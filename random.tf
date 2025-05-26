resource "random_string" "myrandom" {
  length = 10
  upper = true
  lower = true
  numeric = false
  special = true
}