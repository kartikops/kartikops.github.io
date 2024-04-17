resource "aws_iam_user" "kartik_kocher" {
  name = "Kartik Kocher"
  tags = {
    Email    = "kartikkocher@gmail.com"
    Phone    = "+91-9999298120"
    Address  = "Bhiwani, Haryana, India"
  }
}

resource "aws_iam_user_policy" "core_competencies" {
  name = "Core-Competencies"
  user = aws_iam_user.kartik_kocher.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "cloud:ManageAWS",
          "infra:UseTerraform",
          "devops:ImplementCI/CD",
          "security:ImplementBestPractices"
        ]
        Resource = ["AWS", "Terraform", "Jenkins", "AWS CodePipeline", "AWS IAM", "Security Groups"]
      },
    ]
  })
}

resource "aws_instance" "professional_experience" {
  instance_type = "t2.micro"
  tags = {
    Company1 = "Ingram Micro Cloud"
    Role1    = "Team Lead, Cloud Operations"
    Company2 = "REVE Systems India Pvt. Ltd."
    Role2    = "Senior AWS Engineer, Cloud Services"
    Company3 = "GAIL (India) Limited"
    Role3    = "Network Technician, System Operations"
  }
}

resource "local_file" "key_projects" {
  filename = "${path.module}/key_projects.txt"
  content = <<-EOT
    AWS Infrastructure Automation: Automated provisioning of AWS resources using Terraform, reducing setup time by 80%.
    Cost Optimization Initiative: Led cost analysis and reduction strategies, achieving a 40% reduction in expenses.
    High Availability Systems Design: Developed solutions ensuring 99.99% availability using AWS RDS Multi-AZ.
  EOT
}

resource "local_file" "certifications" {
  filename = "${path.module}/certifications.txt"
  content = <<-EOT
    AWS Certified Solutions Architect – Professional
    AWS Certified DevOps Engineer – Professional
    Microsoft Certified: Azure Administrator Associate
  EOT
}

resource "local_file" "education" {
  filename = "${path.module}/education.txt"
  content = <<-EOT
    Bachelor of Technology (B.Tech), MDU Haryana, 2013
  EOT
}
