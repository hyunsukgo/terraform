
resource "aws_efs_mount_target" "efs-mtg_1" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_subnet.INTERNAL1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
  ip_address = "10.200.0.206"
}

resource "aws_efs_mount_target" "efs-mtg_2" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_subnet.INTERNAL2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}
 

resource "aws_efs_mount_target" "s4h-a" {
  file_system_id = aws_efs_file_system.s4h.id
  subnet_id      = aws_subnet.INTERNAL2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}


resource "aws_efs_mount_target" "s4h-c" {
  file_system_id = aws_efs_file_system.s4h.id
  subnet_id      = aws_subnet.INTERNAL1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}
 



resource "aws_efs_mount_target" "bo-a" {
  file_system_id = aws_efs_file_system.bo.id
  subnet_id      = aws_subnet.INTERNAL1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}

resource "aws_efs_mount_target" "bo-c" {
  file_system_id = aws_efs_file_system.bo.id
  subnet_id      = aws_subnet.INTERNAL2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}

resource "aws_efs_mount_target" "po-a" {
  file_system_id = aws_efs_file_system.po.id
  subnet_id      = aws_subnet.INTERNAL1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}

resource "aws_efs_mount_target" "po-c" {
  file_system_id = aws_efs_file_system.po.id
  subnet_id      = aws_subnet.INTERNAL2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_efs.id]
}