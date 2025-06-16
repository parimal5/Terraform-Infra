output "publicIP" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}
output "ami-id" {
  description = "This is AMI ID"
  value       = data.aws_ami.AmazonLinuxAMI.id
}
output "ami-id" {
  description = "This is AMI name"
  value       = data.aws_ami.AmazonLinuxAMI.name
}
output "node-id" {
  description = "This is Node ID"
  value       = aws_instance.web.id
}
