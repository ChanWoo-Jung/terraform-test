variable "db_username" { 
  description = "The Username for the database"
  type = string
  sensitive = true

}

variable "db_password" {
  description = "The Password for the database"
  type = string
  sensitive = true
}

