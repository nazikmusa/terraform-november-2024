provider aws {
    region = "us-east-2"
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "web" {
  ami           = "ami-018875e7376831abe"
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name

  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = self.public_ip 
    private_key = file("~/.ssh/id_rsa")
  }
  
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y"
    ]
  }
}
    












