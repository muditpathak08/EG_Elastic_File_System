variable "region" {
  description = "Region"
  default     = "us-east-2"
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


variable "efs_tags" {
    default = {
      SubnetId             = ""
      ExistingSG              = "test@hotstar.com"
      Environment              = "test@hotstar.com"
      ApplicationFunctionality                 = ""
      ApplicationName                       = ""
      ApplicationOwner            = ""
      ApplicationTeam = "test@hotmail.com"
      BackupSchedule                  = ""
      BusinessOwner              = ""
      BusinessTower             = ""
      InstanceIP         = ""
      Name                  = ""
      OperatingSystem                    = ""
      OperatingSystemSupportTeam            = ""
      scheduler                   = ""
      ServerProcess         = ""
      ServerRoleType= ""
      ServiceCriticality=""
      TicketReference=""
      DNSEntry=""
      DesignDocumentLink=""
    }
    description = "Tags for Elastic File System"
    type        = map(string)
  }



