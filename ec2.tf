resource "aws_instance" "server1" {
  ami               = "ami-0ca9fb66e076a6e32"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = aws_key_pair.aws_key.key_name
  subnet_id         = aws_subnet.public1.id
  # security_groups   = [aws_security_group.sg-demo.name]
  vpc_security_group_ids = [ aws_security_group.sg-demo.id ]
  user_data         = file("server.sh")
  tags = {
    Name      = "utc-dev-ints"
    Team      = "Cloud Transformation"
    Create_by = "moktar"
  }
}

# resource "aws_ebs_volume" "ec2-ebs" {
#   availability_zone = "us-east-1c"
#   size              = 40

#   tags = {
#     Name = "ec2-ebs"
#   }
# }


# # Attach the EBS volume to the EC2 instance
# resource "aws_volume_attachment" "ec2-ebs" {
#   device_name = "/dev/sdh"  # Device name on the EC2 instance
#   volume_id   = aws_ebs_volume.ec2-ebs.id
#   instance_id = aws_instance.server1.id
# }
