variable "region" {
     default = "us-west-1"
}
variable "availabilityZone" {
     default = "us-west-1a"
}
variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "vpcCIDRblock" {
    default = "10.0.0.0/16"
}
variable "publicsCIDRblock" {
    default = "10.0.1.0/24"
}
variable "privatesCIDRblock" {
    default = "10.0.2.0/24"
}
variable "mngtCIDRblock" {
    default = "10.0.3.0/24"
}
variable "publicdestCIDRblock" {
    default = "0.0.0.0/0"
}
variable "localdestCIDRblock" {
    default = "10.0.0.0/16"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}