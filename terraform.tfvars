region = "us-east-2"
vpc_id=""
subnet_id = "subnet-0b86a94123ccf1094"
security_group_name="efs_sg"
secgroupdescription=""
existing_security_groups_id = ["sg-0c5426001fd0fb679","sg-033170e1d5fe97eaa"]


efs_tags = {
      Name         = "testFileSystem"
      ApplicationFunctionality                 = "Test"
      ApplicationName                       = ""
      OperatingSystem = "Windows/Linux"
      OperatingSystemSupportTeam ="abc"
      scheduler ="abc"
      ServerProcess = "abc"
      ServerRoleType="abc"
      TicketReference="CHG"
      DNSEntry="abc"
      DesignDocumentLink="abc"
}

Environment="Dev"
ApplicationOwner="abc@hotmail.com"
ApplicationTeam="Team1"
BackupSchedule="DR7y"
BusinessTower="abc@gmail.com"
BusinessOwner="abc@gmail.com"
ServiceCriticality="Medium"

ingress_rules =[
 
{
      from_port   = "2049"
      to_port     = "2049"
      protocol    = "tcp"
      cidr_block  = "192.168.161.215/32"
      description = "EFS Security Group"
    }
]

