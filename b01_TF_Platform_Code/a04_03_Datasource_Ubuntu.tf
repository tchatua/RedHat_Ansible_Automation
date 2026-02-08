/*
    AMI Datasource

    - Retrieve the latest Ubuntu 22.04 LTS (Jammy Jellyfish) AMI (x86_64)
      published by Canonical.

    - Filters applied:
        AMI name pattern: ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*
        Root device type: EBS-backed
        Virtualization type: HVM

    Using a data source avoids hardcoding AMI IDs, which vary by region
    and change over time.
*/

data "aws_ami" "ubuntu_2204" {
  most_recent = true
  owners      = ["099720109477"] # Canonical official owner ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
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
