locals {
  sufix = "${var.tags.Project}-${var.tags.Region}-${var.tags.env}"   #recurso-projecto-prod-region
}

resource "random_string" "sufix_s3" {
  length = 8
  special = false
  upper = false
}

locals {
  sufix_s3 = "${var.tags.Project}-${random_string.sufix_s3.id}"
}