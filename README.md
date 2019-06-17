terraform-aws-dms-iam-role
==========================
Terraform module to create IAM roles required by AWS DMS.


Usage
-----
This module will create two roles by default, `dms-vpc-role` and `dms-cloudwatch-logs-role`.
If you use Amazon Redshift as a target database, you must create `dms-access-for-endpoint` IAM role in your AWS account.
Set `create_dms_access_for_endpoint_role = "true"` to create `dms-access-for-endpoint` IAM role.


Examples
--------
* [Minimal / Default](https://github.com/traveloka/terraform-aws-dms-iam-role/tree/master/examples/minimal)
* [Full feature](https://github.com/traveloka/terraform-aws-dms-iam-role/tree/master/examples/full)


Terraform Version
-----------------
This module was created using Terraform 0.11.14. 


AWS Provider Version
--------------------
This module was created using AWS Provider 2.15.


Authors
-------
* [Darwin Wirawan](https://github.com/nin9swells)


License
-------
Apache 2 Licensed. See LICENSE for full details.
