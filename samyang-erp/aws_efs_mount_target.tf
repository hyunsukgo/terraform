
resource "aws_efs_mount_target" "efs-mtg_1" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_subnet.INTERNAL1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}
 

resource "aws_efs_mount_target" "efs-mtg_3" {
  file_system_id = aws_efs_file_system.saptrans.id
  subnet_id      = aws_subnet.INTERNAL2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}


resource "aws_efs_mount_target" "efs-mtg_4" {
  file_system_id = aws_efs_file_system.saptrans.id
  subnet_id      = aws_subnet.INTERNAL1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}
 

resource "aws_efs_mount_target" "efs-mtg_2" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_subnet.INTERNAL2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}