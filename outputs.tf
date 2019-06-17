output "dms_vpc_role_name" {
  description = "The name of dms-vpc-role"
  value       = "${aws_iam_role.dms-vpc-role.name}"
}

output "dms_vpc_role_arn" {
  description = "The Amazon Resource Name (ARN) of dms-vpc-role"
  value       = "${aws_iam_role.dms-vpc-role.arn}"
}

output "dms_cloudwatch_logs_role_name" {
  description = "The name of dms-cloudwatch-logs-role"
  value       = "${aws_iam_role.dms-cloudwatch-logs-role.name}"
}

output "dms_cloudwatch_logs_role_arn" {
  description = "The Amazon Resource Name (ARN) of dms-cloudwatch-logs-role"
  value       = "${aws_iam_role.dms-cloudwatch-logs-role.arn}"
}

output "dms_access_for_endpoint_role_name" {
  description = "The name of dms-access-for-endpoint"
  value       = "${element(concat(aws_iam_role.dms-access-for-endpoint.*.name, list("")), 0)}"
}

output "dms_access_for_endpoint_role_arn" {
  description = "The Amazon Resource Name (ARN) of dms-access-for-endpoint"
  value       = "${element(concat(aws_iam_role.dms-access-for-endpoint.*.arn, list("")), 0)}"
}
