
source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "b1gkk6s09frtf2itrvop"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-docker"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = "e9bsklhc4pgboikkfdsl"
  token               = "y0_AgAAAAA5Q4q8AATuwQAAAAEA1QdNAACjqFkjvdFDLo7enzAoVoH_IdZNtA"
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [<<-EOF
       
        "sudo apt-get install ca-certificates curl gnupg"
        "sudo install -m 0755 -d /etc/apt/keyrings"
        "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg"
        "sudo chmod a+r /etc/apt/keyrings/docker.gpg"

        "echo \
          "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
          $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null"
        
 
        "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
      EOF    
      ]
  
 } 

}
