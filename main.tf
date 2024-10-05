resource "aws_instance" "terrateam-instance" {
  ami = "ami-0e86e20dae9224db8" 
  instance_type = "t2.micro"
  subnet_id = "subnet-02efa144df0a77c13" 

  tags = {
    Name        = "TerraTeamInitialInstance"
    Environment = "Production"
    Owner       = "Saksham"   
    Version     = "1.0"        
  }
}
