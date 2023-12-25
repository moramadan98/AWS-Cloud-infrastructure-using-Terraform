

resource "aws_instance" "bastion1" {
  ami                         = var.ami
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id] # reference the security group created earlier
  subnet_id                   = module.Network.pub_sub_1_id
  associate_public_ip_address = "true" # to get public ip
  key_name                    = aws_key_pair.tf-public-key.key_name



  tags = {
    Name = "Bastion Host 1"
  }
}



resource "aws_instance" "bastion2" {
  ami                         = var.ami
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id] # reference the security group created earlier
  subnet_id                   = module.Network.pub_sub_2_id
  associate_public_ip_address = "true" # to get public ip
  key_name                    = aws_key_pair.tf-public-key.key_name



  tags = {
    Name = "Bastion Host 2"
  }
}



resource "aws_instance" "application1" {
  ami                    = var.ami
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_3000.id] # reference the security group created earlier
  subnet_id              = module.Network.pri_sub_1_id
  key_name               = aws_key_pair.tf-public-key.key_name




  tags = {
    Name = "application Host 1"
  }
}



resource "aws_instance" "application2" {
  ami                    = var.ami
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_3000.id] # reference the security group created earlier
  subnet_id              = module.Network.pri_sub_2_id
  key_name               = aws_key_pair.tf-public-key.key_name

  


  tags = {
    Name = "application Host 2"
  }
}