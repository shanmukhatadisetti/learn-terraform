variable "fruits" {
  default = "orange"
}

output "fruits" {
  value = var.fruits
}

variable "fruits_list" {
  default = ["apple","pineapple"]
}

output "fruits_list" {
  value = var.fruits_list[0]
}