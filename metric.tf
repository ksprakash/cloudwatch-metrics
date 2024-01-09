resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  for_each            = var.instances
  alarm_name          = "CPUUtilizationHigh-${each.value}-${each.key}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"  # 5-minute intervals
  statistic           = "Average"
  threshold           = "90"
  actions_enabled     = true

  dimensions = {
    InstanceId = "${each.key}"
  }

  alarm_actions = [var.sns_action_arn]
}

resource "aws_cloudwatch_metric_alarm" "system_check_failure_alarm" {
  for_each            = var.instances
  alarm_name          = "SystemCheckFailure-${each.value}-${each.key}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = "300"  # 5-minute intervals
  statistic           = "Maximum"
  threshold           = "1"
  actions_enabled     = true

  dimensions = {
    InstanceId = "${each.key}"
  }

  alarm_actions = [var.sns_action_arn]
}

resource "aws_cloudwatch_metric_alarm" "instance_check_failure_alarm" {
  for_each            = var.instances
  alarm_name          = "InstanceCheckFailure-${each.value}-${each.key}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed_Instance"
  namespace           = "AWS/EC2"
  period              = "300"  # 5-minute intervals
  statistic           = "Maximum"
  threshold           = "1"
  actions_enabled     = true

  dimensions = {
    InstanceId = "${each.key}"
  }

  alarm_actions = [var.sns_action_arn]
}