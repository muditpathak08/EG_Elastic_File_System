resource "aws_efs_file_system" "efs" {
   creation_token = "efs"
   performance_mode = "generalPurpose"
  #  throughput_mode = "bursting"
   throughput_mode = var.throughput_mode
   encrypted = "true"
  tags = merge(tomap(var.efs_tags),{
      Name      = var.efs_name,
      ApplicationOwner = var.ApplicationOwner, 
      ApplicationTeam = var.ApplicationTeam, 
      BackupSchedule =var.BackupSchedule,
      BusinessOwner = var.BusinessOwner,
      ServiceCriticality = var.ServiceCriticality,
      VPC-id = var.vpc_id})
 }

# module "aws_security_group" {
#   source      = "./modules/security_group"
# #   sg_count = length(var.security_groups)
#   name = var.security_group_name
#   description = var.secgroupdescription
#   vpc_id      = var.vpc_id

# } 

module "new_security_group" {
  source = "./modules/security_group_new"
  security_rules = var.security_rules  
  vpc_id = var.vpc_id
}



# resource "aws_security_group_rule" "ingress_rules" {

#   count = length(var.ingress_rules)

#   type              = "ingress"
#   from_port         = var.ingress_rules[count.index].from_port
#   to_port             = var.ingress_rules[count.index].to_port
#   protocol          = var.ingress_rules[count.index].protocol
#   cidr_blocks       = [var.ingress_rules[count.index].cidr_block]
#   description       = var.ingress_rules[count.index].description
#   # security_group_id = module.aws_security_group.id[count.index]
#   security_group_id = module.aws_security_group.id
# }


resource "aws_efs_mount_target" "efs-mt" {
   count = length(var.subnet_id)
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = var.subnet_id[count.index]
#    security_groups = [aws_security_group.efs.id]

  #  subnet_id = var.subnet_id
  #  security_groups = [module.aws_security_group.id]
  security_groups = concat(module.new_security_group.id[*],var.existing_security_groups_id[*])
 }

   