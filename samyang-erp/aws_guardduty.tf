resource "aws_guardduty_detector" "samyang_detector" {
  enable = true
  tags ={
      Name = "${var.service_name}-gd"
  }
}