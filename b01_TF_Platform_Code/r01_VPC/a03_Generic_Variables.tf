# ##############################################################################################################
# Input Variables
# ##############################################################################################################

variable "buisness_division" {
  description = "Genesis"

}
variable "environment" {
  description = "Dev"
}

# ##############################################################################################################
# AWS Provider Block
variable "profile" {
  type        = string
  description = "AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials"
}
variable "location" {
  type        = string
  description = "AWS Region in which AWS Resources to be created"
}


