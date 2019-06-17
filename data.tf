data "aws_iam_policy_document" "assume_role_policy_for_dms" {
  statement = {
    actions = ["sts:AssumeRole"]

    principals = {
      type        = "Service"
      identifiers = ["dms.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "assume_role_policy_for_dms_and_redshift" {
  statement = {
    actions = ["sts:AssumeRole"]

    principals = {
      type = "Service"

      identifiers = [
        "dms.amazonaws.com",
        "redshift.amazonaws.com",
      ]
    }
  }
}
