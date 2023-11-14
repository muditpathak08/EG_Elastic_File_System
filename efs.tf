resource "aws_efs_file_system" "efs" {
   creation_token = "efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
  tags = merge(tomap(var.efs_tags),{
      ApplicationOwner = var.ApplicationOwner, 
      ApplicationTeam = var.ApplicationTeam, 
      BackupSchedule =var.BackupSchedule,
      BusinessOwner = var.BusinessOwner,
      ServiceCriticality = var.ServiceCriticality,
      Subnet-id = var.subnet_id,
      VPC-id = var.vpc_id})
 }

module "aws_security_group" {
  source      = "./modules/security_group"
#   sg_count = length(var.security_groups)
  name = var.security_group_name
  description = var.secgroupdescription
  vpc_id      = var.vpc_id

} 


resource "aws_security_group_rule" "ingress_rules" {

  count = length(var.ingress_rules)

  type              = "ingress"
  from_port         = var.ingress_rules[count.index].from_port
  to_port           = var.ingress_rules[count.index].to_port
  protocol          = var.ingress_rules[count.index].protocol
  cidr_blocks       = [var.ingress_rules[count.index].cidr_block]
  description       = var.ingress_rules[count.index].description
  # security_group_id = module.aws_security_group.id[count.index]
  security_group_id = module.aws_security_group.id
}


resource "aws_efs_mount_target" "efs-mt" {
#    count = length(data.aws_availability_zones.available.names)
   file_system_id  = aws_efs_file_system.efs.id
#    subnet_id = aws_subnet.subnet[count.index].id
#    security_groups = [aws_security_group.efs.id]

   subnet_id = var.subnet_id
   security_groups = [module.aws_security_group.id]
 }