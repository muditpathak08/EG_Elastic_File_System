region = "us-east-2"
vpc_id="vpc-0419802ed12eec58a"
subnet_id = ["subnet-0b86a94123ccf1094","subnet-04eff055558594bd7"]
security_group_name="efs_sg"
secgroupdescription="EFS Security Group"
existing_security_groups_id = ["sg-07cf755b1aef6c22a"]


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
efs_name = "EG_EFS_Demo"
throughput_mode="bursting"


ingress_rules =[
 
{
      from_port   = "80"
      to_port     = "80"
      protocol    = "tcp"
      cidr_block  = "192.168.161.215/32"
      description = "ELB"
    },

    {
      from_port   = "8080"
      to_port     = "8080"
      protocol    = "tcp"
      cidr_block  = "192.168.161.215/32"
      description = "ELB Port 8080"
    },
{
      from_port   = "1234"
      to_port     = "1234"
      protocol    = "tcp"
      cidr_block  = "192.168.161.215/32"
      description = "ELB Port 1234"
    }
]

