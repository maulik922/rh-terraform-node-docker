resource "aws_cloudwatch_log_group" "ec2_log_group" {
  name              = "/aws/ec2/application_logs"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_metric_filter" "example_metric_filter" {
  name           = "example-metric-filter"
  log_group_name = aws_cloudwatch_log_group.ec2_log_group.name
  pattern        = "ERROR"

  metric_transformation {
    name      = "ErrorCount"
    namespace = "EC2/Application"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "example_alarm" {
  alarm_name          = "example-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.example_metric_filter.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.example_metric_filter.metric_transformation[0].namespace
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions              = []  // Add SNS topic ARN or other actions here
  ok_actions                 = []
  insufficient_data_actions  = []
}
