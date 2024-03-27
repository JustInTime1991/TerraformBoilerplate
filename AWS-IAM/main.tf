resource "aws_iam_user" "admin-user" {
    name = "lucy"
    tags = {
        description = "Technical Team Leader"
    }
}

resource "aws_iam_policy" "adminUser" {
    name = "AdminUsers"
    policy = jsonencode(  #can also read in a json file by using file("my json policy file location")
        {
        "Version": "2012-10-17",
        "Statement":[
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
    )
}

resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
    user = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.adminUser.arn
}