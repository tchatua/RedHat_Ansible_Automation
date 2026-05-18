/*
    AMI Datasource

    - Retrieve the latest Red Hat Enterprise Linux 9 AMI (x86_64)
        This data source queries AWS to dynamically fetch the most recent
        RHEL 9 AMI published by Red Hat. It ensures that EC2 instances
        always use an up-to-date, secure, and officially supported image.

    - Filters applied:
        AMI name pattern: RHEL-9.*_HVM-*-x86_64-*
        Root device type: EBS-backed
        Virtualization type: HVM

    Using a data source avoids hardcoding AMI IDs, which vary by region
    and change over time.
*/

data "aws_ami" "rhel9" {
  most_recent = true
  owners      = ["309956199498"] # Red Hat official AWS account ID

  filter {
    name   = "name"
    values = ["RHEL-9.*_HVM-*-x86_64-*"]
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
