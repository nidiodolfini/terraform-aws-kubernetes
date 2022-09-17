variable "usuario" {
    default = "nidio"
}
variable "regiao" {
     default = "us-west-1"
}
variable "zona_disponibilidade" {
     default = "us-west-1a"
}
variable "tipo_criacao" {
    default = "default"
}
variable "suporte_dns" {
    default = true
}
variable "dns_host_names" {
    default = true
}
variable "bloco_ip_vpc" {
    default = "10.0.0.0/16"
}
variable "bloco_ip_kubernetes" {
    default = "10.0.1.0/24"
}
variable "bloco_ip_gerenciamento" {
    default = "10.0.2.0/24"
}
variable "bloco_ip_privado" {
    default = "10.0.3.0/24"
}
variable "bloco_ip_destino_publico" {
    default = "0.0.0.0/0"
}
variable "bloco_ip_destino_local" {
    default = "10.0.0.0/16"
}
variable "mapear_ip_publico" {
    default = true
}
variable "tipo_instancia" {
    default = "t2.micro"
}
variable "tipo_instancia_kubernetes" {
    default = "t2.medium"
}
variable "imagem_instancia_ami" {
    default = "ami-085284d24fe829cd0"
}