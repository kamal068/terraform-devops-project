resource "aws_cognito_user_pool" "user_pool" {
  name = "${var.project_name}-userpool"

  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = false
    require_uppercase = true
  }

  tags = {
    Name        = "${var.project_name}-cognito"
    Environment = "Dev"
  }
}

resource "aws_cognito_user_pool_client" "app_client" {
  name                   = "${var.project_name}-client"
  user_pool_id           = aws_cognito_user_pool.user_pool.id
  generate_secret        = false

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
  ]
}