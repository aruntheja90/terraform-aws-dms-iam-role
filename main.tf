resource "aws_iam_role" "dms-vpc-role" {
  name        = "dms-vpc-role"
  path        = "/"
  description = "IAM role for DMS to manage VPC"

  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy_for_dms.json}"

  tags = {
    Name        = "dms-vpc-role"
    Description = "IAM role for DMS to manage VPC"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_role_policy_attachment" "dms-vpc-role-AmazonDMSVPCManagemnetRole" {
  role       = "${aws_iam_role.dms-vpc-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSVPCManagementRole"
}

resource "aws_iam_role" "dms-cloudwatch-logs-role" {
  name        = "dms-cloudwatch-logs-role"
  path        = "/"
  description = "IAM role for DMS to send logs to CWL"

  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy_for_dms.json}"

  tags = {
    Name        = "dms-cloudwatch-logs-role"
    Description = "IAM role for DMS to send logs to CWL"
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_role_policy_attachment" "dms-cloudwatch-logs-role-AmazonDMSCloudWatchLogsRole" {
  role       = "${aws_iam_role.dms-cloudwatch-logs-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSCloudWatchLogsRole"
}

resource "aws_iam_role" "dms-access-for-endpoint" {
  name        = "dms-access-for-endpoint"
  path        = "/"
  description = "IAM role for DMS and using Amazon Redshift as a target database"

  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy_for_dms_and_redshift.json}"

  tags = {
    Name        = "dms-access-for-endpoint"
    Description = "IAM role for DMS and using Amazon Redshift as a target database"
    ManagedBy   = "terraform"
  }

  count = "${var.create_dms_access_for_endpoint_role?1:0}"
}

resource "aws_iam_role_policy_attachment" "dms-access-for-endpoint-AmazonDMSRedshiftS3Role" {
  role       = "${aws_iam_role.dms-access-for-endpoint.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSRedshiftS3Role"

  count = "${var.create_dms_access_for_endpoint_role?1:0}"
}
