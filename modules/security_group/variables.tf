variable "name" {
  description = "A list of new Security Group names to associate with EC2 instance."
  type = string

  }

variable "description" {
    description = "Description if any for the Security Group"

  }

variable "vpc_id" {
    description = "VPC ID"

  }





# variable "name_security_groups" {
#   description = "(Optional) Number of EBS volumes to create"
#   type        = list(string)
# }



