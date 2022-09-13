#levando nossa chave publica, lá pra AWS, pois assim podemos
#usa nossa chaves em várias regiões e serviços
resource "aws_key_pair" "nidio-terraform-aws-key" {
  #passando o nome da chave que vamos usar
  key_name = "nidio-terraform-aws"
  #passando o arquivo que será levado para a AWS .pub = fechadura
  public_key = file("terraform-aws.pub")
}