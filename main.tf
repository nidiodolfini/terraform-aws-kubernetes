#denifinimos a região que vamos utilizar na AWS.
#1º parametro entre "" é o recurso
provider "aws" {
  region = var.regiao
  #access_key = " "
  #secret_key = " "
}



# terraform init - baixar os modulos do terraform baseado nos seus arquivos
# terraform plan - mostrar o plano a ser feito
# terraform apply - vai aplicar o plano ou seja vai contruir tudo se não tiver erro
# terraform destroy - acabou, já era boa sorte
# terraform output - mostra as saidas do output
# terraform show - mostra como está a sua infra
