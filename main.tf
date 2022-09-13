#denifinimos a região que vamos utilizar na AWS.
#1º parametro entre "" é o recuerso
#segundo é o nome que iremos usar 
#como referencia aqui no terraform. Isso serve para todos os recursos.
provider "aws" {
  region = "ca-central-1" #california
}



# terraform init - baixar os modulos do terraform baseado nos seus arquivos
# terraform plan - mostrar o plano a ser feito
# terraform apply - vai aplicar o plano ou seja vai contruir tudo se não tiver erro
# terraform destroy - acabou, já era boa sorte
# terraform output - mostra as saidas do output
# terraform show - mostra como está a sua infra
