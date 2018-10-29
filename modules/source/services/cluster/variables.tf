variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  default     = "common"
}


variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  default     = "1"
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
   default     = "1"
  
}

variable "desired_capacity" {
  description = "The maximum number of EC2 Instances in the ASG"
   default     = "1"
  
}

# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AWS access key"
  default     = ""
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
  default     = ""
}

variable "ecs_cluster" {
  description = "ECS cluster name"
  default     = "common-cluster"
}

variable "key_path" {
description = "Key path for SSHing into EC2"
}
variable "key_name" {
  description = "Key path for SSHing into EC2"

}

variable "region" {
  description = "AWS region"

}



########################### Test VPC Config ################################

variable "instance_type" {
    default = "t2.medium"
}

variable "env_name" {
    default = "uat"
}

variable "ami_id" {
description= "ami-id"

variable "vpc-id" {
    description = "vpc-id"
}

variable "vpc_id" {
    default = "common"
}

	
variable "subnet_id" {
    description = "subnet-id"
}

variable "subnet_id_elb" {
           description = "subnet-id"
    
}


variable "security-group" {
    description = "sg"
}


variable "iam_role" {
    description = "arn"
}

variable "task_definition" {
    description = "arn"
}

variable "ssl_policy" {
  default = "ELBSecurityPolicy-2015-05"
}

variable "www_domain_name" {
  default = "uat-common.com"
}

variable "root_domain_name" {
  default = "common.com"
}
########################### ECS Config ################################


variable "container_name" {
  default = "common"
}
