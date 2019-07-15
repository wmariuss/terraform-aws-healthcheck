resource "random_string" "string" {
  length = 16
  special = true
  override_special = "/@\" "
}
