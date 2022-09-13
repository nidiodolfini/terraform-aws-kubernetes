#output é tipo sysout.print.ln ou 
#console.log ele vai mostrar algo no terminal
output "instance_front_public_ip" {
    #descrição sabermos o que vai ser impresso no terminal
    description = "Ip publico front"
    #o que vai ser impresso, estou pedindo o IP publico da instancia
    #que vai ser criar com o nome de front_nidio-ec2 no lugar do * 
    #vai entrar o do contador
    value = aws_instance.front_nidio-ec2.*.public_ip
}
output "instance_front_private_ip" {
    description = "Ip privado front"
    #pedindo para ser impresso o IP privado das maquinas do front
    value = aws_instance.front_nidio-ec2.*.private_ip
}

output "instance_mngt_public_ip" {
    description = "Ip publico MNGT"
    #pedindo para ser impresso o IP publico da maquina do mngt
    value = aws_instance.mngt_nidio-ec2.*.public_ip
}

# output "instance_id" {
#     description = "ID das instancias"
#     value = aws_instance.front_nidio-ec2.*.id
# }


# output "instance_public_dns" {
#     description = "DNS publico"
#     value = aws_instance.front_nidio-ec2.*.public_dns
        
# }
