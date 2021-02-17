resource "aws_guardduty_detector" "samyang_detector" {
  enable = true
  tags ={
      Name = "${customer_info}-gd"
  }
}