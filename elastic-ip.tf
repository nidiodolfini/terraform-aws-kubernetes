#Elastic IP, fornece IP publico.
resource "aws_eip" "nidio_nat_eip" {
  #estamos dizendo que queremos IP publico.
  vpc        = true
}