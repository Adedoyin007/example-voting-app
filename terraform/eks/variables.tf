variable "aws_region" {
  description = "AWS region for the EKS cluster"
  type        = string
  default     = "eu-west-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "voting-app-eks"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.36"
}

variable "vpc_id" {
  description = "Existing default VPC ID"
  type        = string
  default     = "vpc-09c2953d5a57ac87e"
}

variable "subnet_ids" {
  description = "Existing public subnet IDs across Availability Zones"
  type        = list(string)
  default = [
    "subnet-0f1ac3918a2838cf5",
    "subnet-093ebbcad7d7992dd",
    "subnet-0941bd38bceba4233",
    "subnet-0d23d2a9b922dab59"
  ]
}

variable "instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "m7i-flex.large"
}
