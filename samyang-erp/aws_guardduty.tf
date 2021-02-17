resource "aws_guardduty_detector" "samyang_detector" {
  enable = true
  tags ={
      Name = "${var.customer_info.name}-gd"
  }
}