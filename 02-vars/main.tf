variable "fruits" {
  default = "orange"
}

output "fruits" {
  value = var.fruits
}

variable "fruits_list" {
  default = ["apple","pineapple","papaya"]
}

output "fruits_list" {
  value = var.fruits_list[0]
}

variable "fruits_mapp" {
  default = {
    grapes = 10
    papaya = 20
    apply = 30
  }
}

output "fruits_price" {
  value = "price of papaya = ${var.fruits_mapp["papaya"]}"
}