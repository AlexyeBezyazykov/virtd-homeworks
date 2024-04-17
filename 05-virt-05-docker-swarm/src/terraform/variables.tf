# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1gnuldr4183fmmqop51"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1gkk6s09frtf2itrvop"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "centos-7-base" {
  default = "fd85fbh332jqo6lq9j58"
}

variable "yandex_token" {
  default = "y0_AgAAAAA5Q4q8AATuwQAAAAEA1QdNAACjqFkjvdFDLo7enzAoVoH_IdZNtA"
}