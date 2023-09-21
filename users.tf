resource "aws_iam_user" "user-demo" {
  name = "serge2026"
  tags = {
    Team                = "Devops"
    Env                 = "Dev"
    create_by_terraform = "yes"
    Owner               = "serge"
    email               = "dimitri@gmail.com"

  }
}