variable  "instances" {
    default = {
        "i-07752c0de58559c5c"	= "AW-Zabbix"
    }
}

variable "sns_action_arn" {
    default = "arn:aws:sns:us-east-1:705927653211:MIS"
}