variable "stage" {
  default = "gamma"
}

variable "ipsum" {
  type = "map"

  default = {
    colot = "dolor"
  }
}

resource "aws_s3_bucket" "agent_bucket" {
  bucket = "${var.stage}-${var.region}-mybucket"
  acl    = "private"

  smurf = <<HEREDOC
Lorem ${var.ipsum} dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna
aliqua. Ut enim ad minim veniam, quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure ${lookup(var.ipsum, "dolor")} in reprehenderit
in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
HEREDOC

  logging {
    target_bucket = "${var.stage}-${var.region}-mymonitoringbucket"
    target_prefix = "aprefix/"
  }

  subkey {
    smurf = "gargamel"
  }
}

output "iam_user_agent" {
  value = "smurf"
}
