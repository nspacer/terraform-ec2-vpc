resource "aws_instance" "ec2_example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE
  vpc_security_group_ids = [aws_security_group.publicEC2Security.id]
  subnet_id              = var.myPublicSubnet
  # 2. Key Name
  # Specify the key name and it should match with key_name from the resource "aws_key_pair"
  key_name = var.aws_key_pair
  tags     = {
    Name = "Terraform EC2 - using tls_private_key module"
  }
  depends_on = [var.aws_key_pair]
  #3. Connection Block-
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"

    # Mention the exact private key name which will be generated
    private_key = file("aws_keys_pairs.pem")
    timeout     = "4m"
  }
}
