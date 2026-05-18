/*
    AMI Datasource

    - Retrieve the latest Ubuntu Server 22.04 LTS (Jammy) AMI (x86_64)
        This data source dynamically queries AWS to fetch the most recent
        Ubuntu 22.04 LTS image published by Canonical. It ensures that EC2
        instances always use a secure, up-to-date, and officially supported image.

    - Filters applied:
        AMI name pattern: ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*
        Root device type: EBS-backed
        Virtualization type: HVM

    - Why Ubuntu 22.04 for AWX?
        Ubuntu 22.04 LTS provides long-term support and strong compatibility
        with container runtimes (Docker/Podman) and Kubernetes components
        required for AWX deployments.

    Using a data source avoids hardcoding AMI IDs, which are region-specific
    and change over time.
*/

data "aws_ami" "ubuntu_awx" {
  most_recent = true
  owners      = ["099720109477"] # Canonical official

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