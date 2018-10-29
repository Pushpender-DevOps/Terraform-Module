#######################
data "aws_iam_policy_document" "instance-assume-role-policy" {
 statement {
   actions = ["sts:AssumeRole"]

   principals {
     type        = "Service"
     identifiers = ["ec2.amazonaws.com"]
   }
 }
}

resource "aws_iam_instance_profile" "common" {
 name = "common"
 role = "${aws_iam_role.common-role.name}"
}

resource "aws_iam_role" "common-role" {
 name               = "common-role"
 path               = "/"
 assume_role_policy = "${data.aws_iam_policy_document.instance-assume-role-policy.json}"
}

resource "aws_iam_role_policy_attachment" "ECSFullAccess" {
 role       = "${aws_iam_role.common-role.name}"
 policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}


#############################