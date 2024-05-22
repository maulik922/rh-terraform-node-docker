output "lb_dns_url" {
  value = aws_lb.front_end.dns_name
}

output "cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.ec2_log_group.name
}

output "cloudwatch_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.example_alarm.arn
}