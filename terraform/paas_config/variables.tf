variable "APP_ENV" {
  description = "Environment for the Laravel app (e.g., production, staging)"
  type        = string
  default     = "production"
}

variable "APP_KEY" {
  description = "The application key for Laravel"
  type        = string
}

variable "DB_CONNECTION" {
  description = "Database connection type (e.g., mysql)"
  type        = string
  default     = "mysql"
}

variable "DB_HOST" {
  description = "Database host address"
  type        = string
}

variable "DB_PORT" {
  description = "Database port number"
  type        = string
  default     = "3306"
}

variable "DB_DATABASE" {
  description = "Database name"
  type        = string
}

variable "DB_USERNAME" {
  description = "Database username"
  type        = string
}

variable "DB_PASSWORD" {
  description = "Database password"
  type        = string
  sensitive   = true
}

