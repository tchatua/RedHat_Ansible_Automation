/*
    AMI Datasource

    - Retrieve the latest Amazon Linux 2023 AMI (x86_64)
        This data source queries AWS to dynamically fetch the most recent
        Amazon Linux 2023 AMI published by Amazon. It ensures that EC2 instances
        always use an up-to-date, secure, and officially supported image.

    - Filters applied:
        AMI name pattern: al2023-ami-*x86_64
        Root device type: EBS-backed
        Virtualization type: HVM

    Using a data source avoids hardcoding AMI IDs, which vary by region and change over time.
*/

data "aws_ami" "amzlinux2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
