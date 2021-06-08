
resource "aws_efs_mount_target" "efs-mtg" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = [aws_subnet.INTERNAL1_A.id, aws_subnet.INTERNAL2_C.id]
  security_groups = aws_security_group.allow_from_trust_to_efs.id
}
