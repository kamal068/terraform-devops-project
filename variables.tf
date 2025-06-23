variable "region" {
    description = "AWS Region"
    type = string  
    default = "us-east-1"
}

variable "project_name" {
  description = "Name of Project"
  type = string
  default = "mydevopsproject"
}

variable "db_password" {
    description = "RDS DB password"
    type = string
    sensitive = true
  
}