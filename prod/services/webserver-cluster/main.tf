provider "aws" {
 region = "ap-northeast-2"
}
module "webserver_cluster" {
 source = "../../../module/services/webserver-cluster"
 cluster_name = "webserver-prod"
 db_remote_state_bucket = "terraform-state-cloudwave-23"
 db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
 scheduled_action_name = "scale-out-during-business-hours"
 min_size = 2
 max_size = 10
 desired_capacity = 10
 recurrence = "0 9 * * *"
 autoscaling_group_name = module.webserver_cluster.asg_name
}
resource "aws_autoscaling_schedule" "scale_in_at_night" {
 scheduled_action_name = "scale-in-at-night"
 min_size = 2
 max_size = 10
 desired_capacity = 2
 recurrence = "0 17 * * *"
 autoscaling_group_name = module.webserver_cluster.asg_name
}


