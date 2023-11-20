  variable "region" {
    description = "Region"
    default     = "us-east-2"
    type        = string
  }

variable "vpc_id" {
  description = "Subnet deatials for EFS"
  default     = ""
  type        = string
}

variable "subnet_id" {
  description = "Subnet deatials for EFS"
  default     = ""
  type        = string
}


variable "existing_security_groups_id" {
  description = "Security Group Ids for EFS mount"
  default     = [""]
  type        = list(string)
}

variable "security_group_name" {
  description = "Name of New Security"
  type        = string
  default     = ""
}

variable "secgroupdescription" {
  type = string
  default = "Allow tcp to client host" 
}

variable "efs_name" {
  type = string
  default = "" 
}


variable "throughput_mode" {
  description = "Throughput Mode for the EFS"
  type        = string
  default     = "bursting"

}

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
  default = [

  ]
}




variable "Environment" {
  type    = string
  default = "Dev"

validation {
   condition     = contains(["Dev", "Test" ,"Sandbox", "Staging", "Production"], var.Environment)
   error_message = "Please provide a valid value for variable Envrionment. Allowed values are Dev, Test, Sandbox, Staging and Production"
 }
}


variable "ApplicationOwner" {
  description = "Owner of the Application"
  type        = string
  default     = ""

  validation {
   condition     = contains(["abc@hotmail.com", "abc@gmail.com"], var.ApplicationOwner)
   error_message = "Please provide a valid Application Owner"
 }
}

 variable "ApplicationTeam" {
  description = "Owner of the Application"
  type        = string
  default     = ""

  validation {
   condition     = contains(["Team1","Team2"], var.ApplicationTeam)
   error_message = "Please provide a valid Application Team"
 }
}

variable "BackupSchedule" {
  description = "BackupScheduled of the Volume"
  type        = string
  default     = ""

  validation {
   condition     = contains(["DR7y","DR1y","DR1m"], var.BackupSchedule)
   error_message = "Please provide a valid BackupSchedule. Valid values are DR7y,DR1y and DR1m"
 }
}


variable "BusinessTower" {
  description = "Business Tower"
  type        = string
  default     = ""

  validation {
   condition     = contains(["abc@gmail.com","xyz@gmail.com"], var.BusinessTower)
   error_message = "Please provide a valid BusinessTower"
 }
}


variable "BusinessOwner" {
  description = "Business Owner"
  type        = string
  default     = ""

  validation {
   condition     = contains(["abc@gmail.com","xyz@gmail.com"], var.BusinessOwner)
   error_message = "Please provide a valid BusinessOwner"
 }
}

variable "ServiceCriticality" {
  description = "Business Criticality of the Service"
  type        = string
  default     = ""

  validation {
   condition     = contains(["High","Low","Medium"], var.ServiceCriticality)
   error_message = "Please provide a valid Service Criticality, Valid values are High, Low and Medium"
 }
}


variable "efs_tags" {
    default = {

    }
    description = "Tags for Elastic File System"
    type        = map(string)
  }



