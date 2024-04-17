# Домашнее задание к занятию 6. «Оркестрация кластером Docker контейнеров на примере Docker Swarm»

#### Это задание для самостоятельной отработки навыков и не предполагает обратной связи от преподавателя. Его выполнение не влияет на завершение модуля. Но мы рекомендуем его выполнить, чтобы закрепить полученные знания. Все вопросы, возникающие в процессе выполнения заданий, пишите в учебный чат или в раздел "Вопросы по заданиям" в личном кабинете.

---

## Важно

**Перед началом работы над заданием изучите [Инструкцию по экономии облачных ресурсов](https://github.com/netology-code/devops-materials/blob/master/cloudwork.MD).**
Перед отправкой работы на проверку удаляйте неиспользуемые ресурсы.
Это нужно, чтобы не расходовать средства, полученные в результате использования промокода.
Подробные рекомендации [здесь](https://github.com/netology-code/virt-homeworks/blob/virt-11/r/README.md).

[Ссылки для установки открытого ПО](https://github.com/netology-code/devops-materials/blob/master/README.md).

---

## Задача 1

Создайте ваш первый Docker Swarm-кластер в Яндекс Облаке.
Документация swarm: https://docs.docker.com/engine/reference/commandline/swarm_init/
1. Создайте 3 облачные виртуальные машины в одной сети.
2. Установите docker на каждую ВМ.
3. Создайте swarm-кластер из 1 мастера и 2-х рабочих нод.

4. Проверьте список нод командой:
```
docker node ls
```

````
alex@master:~$ sudo docker swarm init --advertise-addr 10.129.0.3
Swarm initialized: current node (lmjq2fl5eoxtedw19hkiwcevl) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-020aptgko4u97233q2iigfp7rcla84fou3rv86z24uq8xd0laj-416vkyrko38j2q46d2b2kl9xh 10.129.0.3:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

alex@worker1:~$ sudo  docker swarm join --token SWMTKN-1-020aptgko4u97233q2iigfp7rcla84fou3rv86z24uq8xd0laj-416vkyrko38j2q46d2b2kl9xh 10.129.0.3:2377
This node joined a swarm as a worker.

alex@worker2:~$ sudo  docker swarm join --token SWMTKN-1-020aptgko4u97233q2iigfp7rcla84fou3rv86z24uq8xd0laj-416vkyrko38j2q46d2b2kl9xh 10.129.0.3:2377
This node joined a swarm as a worker.

alex@master:~$ sudo docker node ls
ID                            HOSTNAME   STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
lmjq2fl5eoxtedw19hkiwcevl *   master     Ready     Active         Leader           26.0.1
xv8xmt4ffjyctqkzhrdcwi5hf     worker1    Ready     Active                          26.0.1
ax0lby9yo089jmzjopkuxnoft     worker2    Ready     Active                          26.0.1

````




## Задача 3 (*)

Если вы уже знакомы с terraform и ansible  - повторите практику по примеру лекции "Развертывание стека микросервисов в Docker Swarm кластере". Попробуйте улучшить пайплайн, запустив ansible через terraform. 

Проверьте доступность grafana.

Иначе верyитесь к выполнению задания после прохождения модулей "terraform" и "ansible".

````
natalia@MacBook-Pro-Natalia packer % packer validate centos-7-base.json
The configuration is valid.
(venv) natalia@MacBook-Pro-Natalia packer % packer build centos-7-base.json
yandex: output will be in this color.

==> yandex: Creating temporary RSA SSH key for instance...
==> yandex: Error getting source image for instance creation: client-request-id = 5fa789dc-d644-478a-9d5b-32c740bf7088 client-trace-id = 1d9c1263-1e90-4cb6-825e-a35d5816a9f1 iam token create failed: server-request-id = b2d30f0a-9d50-4cad-99f3-50d115c5265a server-trace-id = 41248a8ef104aef9:b9b778b56ab42b07:41248a8ef104aef9:1 client-request-id = 83862790-5dd2-424c-825a-9f4f7fa25974 client-trace-id = 1d9c1263-1e90-4cb6-825e-a35d5816a9f1 rpc error: code = Unauthenticated desc = OAuth token is inv
(venv) natalia@MacBook-Pro-Natalia packer % packer build centos-7-base.json
yandex: output will be in this color.

==> yandex: Creating temporary RSA SSH key for instance...
==> yandex: Using as source image: fd81s04tubv7osmuapjf (name: "centos-7-v20240415", family: "centos-7")
==> yandex: Use provided subnet id e9bcavhnok4and3194qp
==> yandex: Creating disk...
==> yandex: Creating instance...
==> yandex: Waiting for instance with id fhm8t4thfneelct0fjco to become active...
    yandex: Detected instance IP: 158.160.108.213
==> yandex: Using SSH communicator to connect: 158.160.108.213
==> yandex: Waiting for SSH to become available...
==> yandex: Connected to SSH!
==> yandex: Provisioning with shell script: /var/folders/hk/5ty8wjmx7wbcrr150h55vfdw0000gn/T/packer-shell4186927419
    yandex: Loaded plugins: fastestmirror
    yandex: Loading mirror speeds from cached hostfile
    yandex:  * base: mirror.docker.ru
    yandex:  * extras: mirror.sale-dedic.com
    yandex:  * updates: mirror.sale-dedic.com
    yandex: No packages marked for update
    yandex: Loaded plugins: fastestmirror
    yandex: Loading mirror speeds from cached hostfile
    yandex:  * base: mirror.docker.ru
    yandex:  * extras: mirror.sale-dedic.com
    yandex:  * updates: mirror.sale-dedic.com
    yandex: Package iptables-1.4.21-35.el7.x86_64 already installed and latest version
    yandex: Package curl-7.29.0-59.el7_9.2.x86_64 already installed and latest version
    yandex: Package net-tools-2.0-0.25.20131004git.el7.x86_64 already installed and latest version
    yandex: Package rsync-3.1.2-12.el7_9.x86_64 already installed and latest version
    yandex: Package openssh-server-7.4p1-23.el7_9.x86_64 already installed and latest version
    yandex: Resolving Dependencies
    yandex: --> Running transaction check
    yandex: ---> Package bind-utils.x86_64 32:9.11.4-26.P2.el7_9.15 will be installed
    yandex: --> Processing Dependency: bind-libs-lite(x86-64) = 32:9.11.4-26.P2.el7_9.15 for package: 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64
    yandex: --> Processing Dependency: bind-libs(x86-64) = 32:9.11.4-26.P2.el7_9.15 for package: 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64
    yandex: --> Processing Dependency: liblwres.so.160()(64bit) for package: 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64
    yandex: --> Processing Dependency: libisccfg.so.160()(64bit) for package: 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64
    yandex: --> Processing Dependency: libisc.so.169()(64bit) for package: 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64
    yandex: --> Processing Dependency: libirs.so.160()(64bit) for package: 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64
    yandex: --> Processing Dependency: libdns.so.1102()(64bit) for package: 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64
    yandex: --> Processing Dependency: libbind9.so.160()(64bit) for package: 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64
    yandex: --> Processing Dependency: libGeoIP.so.1()(64bit) for package: 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64
    yandex: ---> Package bridge-utils.x86_64 0:1.5-9.el7 will be installed
    yandex: ---> Package tcpdump.x86_64 14:4.9.2-4.el7_7.1 will be installed
    yandex: --> Processing Dependency: libpcap >= 14:1.5.3-10 for package: 14:tcpdump-4.9.2-4.el7_7.1.x86_64
    yandex: --> Processing Dependency: libpcap.so.1()(64bit) for package: 14:tcpdump-4.9.2-4.el7_7.1.x86_64
    yandex: ---> Package telnet.x86_64 1:0.17-66.el7 will be installed
    yandex: --> Running transaction check
    yandex: ---> Package GeoIP.x86_64 0:1.5.0-14.el7 will be installed
    yandex: --> Processing Dependency: geoipupdate for package: GeoIP-1.5.0-14.el7.x86_64
    yandex: ---> Package bind-libs.x86_64 32:9.11.4-26.P2.el7_9.15 will be installed
    yandex: --> Processing Dependency: bind-license = 32:9.11.4-26.P2.el7_9.15 for package: 32:bind-libs-9.11.4-26.P2.el7_9.15.x86_64
    yandex: ---> Package bind-libs-lite.x86_64 32:9.11.4-26.P2.el7_9.15 will be installed
    yandex: ---> Package libpcap.x86_64 14:1.5.3-13.el7_9 will be installed
    yandex: --> Running transaction check
    yandex: ---> Package bind-license.noarch 32:9.11.4-26.P2.el7_9.15 will be installed
    yandex: ---> Package geoipupdate.x86_64 0:2.5.0-2.el7 will be installed
    yandex: --> Finished Dependency Resolution
    yandex:
    yandex: Dependencies Resolved
    yandex:
    yandex: ================================================================================
    yandex:  Package            Arch       Version                        Repository   Size
    yandex: ================================================================================
    yandex: Installing:
    yandex:  bind-utils         x86_64     32:9.11.4-26.P2.el7_9.15       updates     262 k
    yandex:  bridge-utils       x86_64     1.5-9.el7                      base         32 k
    yandex:  tcpdump            x86_64     14:4.9.2-4.el7_7.1             base        422 k
    yandex:  telnet             x86_64     1:0.17-66.el7                  updates      64 k
    yandex: Installing for dependencies:
    yandex:  GeoIP              x86_64     1.5.0-14.el7                   base        1.5 M
    yandex:  bind-libs          x86_64     32:9.11.4-26.P2.el7_9.15       updates     158 k
    yandex:  bind-libs-lite     x86_64     32:9.11.4-26.P2.el7_9.15       updates     1.1 M
    yandex:  bind-license       noarch     32:9.11.4-26.P2.el7_9.15       updates      92 k
    yandex:  geoipupdate        x86_64     2.5.0-2.el7                    updates      35 k
    yandex:  libpcap            x86_64     14:1.5.3-13.el7_9              updates     139 k
    yandex:
    yandex: Transaction Summary
    yandex: ================================================================================
    yandex: Install  4 Packages (+6 Dependent packages)
    yandex:
    yandex: Total download size: 3.8 M
    yandex: Installed size: 9.0 M
    yandex: Downloading packages:
    yandex: --------------------------------------------------------------------------------
    yandex: Total                                              8.0 MB/s | 3.8 MB  00:00
    yandex: Running transaction check
    yandex: Running transaction test
    yandex: Transaction test succeeded
    yandex: Running transaction
    yandex:   Installing : 32:bind-license-9.11.4-26.P2.el7_9.15.noarch                1/10
    yandex:   Installing : geoipupdate-2.5.0-2.el7.x86_64                              2/10
    yandex:   Installing : GeoIP-1.5.0-14.el7.x86_64                                   3/10
    yandex:   Installing : 32:bind-libs-lite-9.11.4-26.P2.el7_9.15.x86_64              4/10
    yandex:   Installing : 32:bind-libs-9.11.4-26.P2.el7_9.15.x86_64                   5/10
    yandex:   Installing : 14:libpcap-1.5.3-13.el7_9.x86_64                            6/10
    yandex: pam_tally2: Error opening /var/log/tallylog for update: Permission denied
    yandex: pam_tally2: Authentication error
    yandex: useradd: failed to reset the tallylog entry of user "tcpdump"
    yandex:   Installing : 14:tcpdump-4.9.2-4.el7_7.1.x86_64                           7/10
    yandex:   Installing : 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64                  8/10
    yandex:   Installing : bridge-utils-1.5-9.el7.x86_64                               9/10
    yandex:   Installing : 1:telnet-0.17-66.el7.x86_64                                10/10
    yandex:   Verifying  : GeoIP-1.5.0-14.el7.x86_64                                   1/10
    yandex:   Verifying  : 14:libpcap-1.5.3-13.el7_9.x86_64                            2/10
    yandex:   Verifying  : 1:telnet-0.17-66.el7.x86_64                                 3/10
    yandex:   Verifying  : 32:bind-libs-9.11.4-26.P2.el7_9.15.x86_64                   4/10
    yandex:   Verifying  : geoipupdate-2.5.0-2.el7.x86_64                              5/10
    yandex:   Verifying  : 32:bind-libs-lite-9.11.4-26.P2.el7_9.15.x86_64              6/10
    yandex:   Verifying  : 32:bind-utils-9.11.4-26.P2.el7_9.15.x86_64                  7/10
    yandex:   Verifying  : 32:bind-license-9.11.4-26.P2.el7_9.15.noarch                8/10
    yandex:   Verifying  : 14:tcpdump-4.9.2-4.el7_7.1.x86_64                           9/10
    yandex:   Verifying  : bridge-utils-1.5-9.el7.x86_64                              10/10
    yandex:
    yandex: Installed:
    yandex:   bind-utils.x86_64 32:9.11.4-26.P2.el7_9.15   bridge-utils.x86_64 0:1.5-9.el7
    yandex:   tcpdump.x86_64 14:4.9.2-4.el7_7.1            telnet.x86_64 1:0.17-66.el7
    yandex:
    yandex: Dependency Installed:
    yandex:   GeoIP.x86_64 0:1.5.0-14.el7
    yandex:   bind-libs.x86_64 32:9.11.4-26.P2.el7_9.15
    yandex:   bind-libs-lite.x86_64 32:9.11.4-26.P2.el7_9.15
    yandex:   bind-license.noarch 32:9.11.4-26.P2.el7_9.15
    yandex:   geoipupdate.x86_64 0:2.5.0-2.el7
    yandex:   libpcap.x86_64 14:1.5.3-13.el7_9
    yandex:
    yandex: Complete!
==> yandex: Stopping instance...
==> yandex: Deleting instance...
    yandex: Instance has been deleted!
==> yandex: Creating image: centos-7-base
==> yandex: Waiting for image to complete...
==> yandex: Success image create...
==> yandex: Destroying boot disk...
    yandex: Disk has been deleted!
Build 'yandex' finished after 2 minutes 37 seconds.

==> Wait completed after 2 minutes 37 seconds

==> Builds finished. The artifacts of successful builds are:
--> yandex: A disk image was created: centos-7-base (id: fd85fbh332jqo6lq9j58) with family name centos
(venv) natalia@MacBook-Pro-Natalia packer % yc config list                                                                                                                        
token: y0_AgAAAAA5Q4q8AATuwQAAAAEA1QdNAACjqFkjvdFDLo7enzAoVoH_IdZNtA
cloud-id: b1gnuldr4183fmmqop51
folder-id: b1gkk6s09frtf2itrvop
compute-default-zone: ru-central1-a
(venv) natalia@MacBook-Pro-Natalia packer % yc compute image list
+----------------------+---------------+--------+----------------------+--------+
|          ID          |     NAME      | FAMILY |     PRODUCT IDS      | STATUS |
+----------------------+---------------+--------+----------------------+--------+
| fd85fbh332jqo6lq9j58 | centos-7-base | centos | f2e7l231e5s5arh2gjtq | READY  |
+----------------------+---------------+--------+----------------------+--------+

(venv) natalia@MacBook-Pro-Natalia terraform % terraform init  

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/null from the dependency lock file
- Reusing previous version of hashicorp/local from the dependency lock file
- Reusing previous version of yandex-cloud/yandex from the dependency lock file
- Using previously-installed hashicorp/local v2.5.1
- Using previously-installed yandex-cloud/yandex v0.115.0
- Using previously-installed hashicorp/null v3.2.2

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
(venv) natalia@MacBook-Pro-Natalia terraform % terraform apply 

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.inventory will be created
  + resource "local_file" "inventory" {
      + content              = (known after apply)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "../ansible/inventory"
      + id                   = (known after apply)
    }

  # null_resource.cluster will be created
  + resource "null_resource" "cluster" {
      + id = (known after apply)
    }

  # null_resource.monitoring will be created
  + resource "null_resource" "monitoring" {
      + id = (known after apply)
    }

  # null_resource.sync will be created
  + resource "null_resource" "sync" {
      + id = (known after apply)
    }

  # null_resource.wait will be created
  + resource "null_resource" "wait" {
      + id = (known after apply)
    }

  # yandex_compute_instance.node01 will be created
  + resource "yandex_compute_instance" "node01" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node01.netology.yc"
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8G8bK83RALbmsKdL4ghdD8rLTG3eYdOZb9g2uKSG5I root@MacBook-Pro-Natalia.local
            EOT
        }
      + name                      = "node01"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd85fbh332jqo6lq9j58"
              + name        = "root-node01"
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.11"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }
    }

  # yandex_compute_instance.node02 will be created
  + resource "yandex_compute_instance" "node02" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node02.netology.yc"
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8G8bK83RALbmsKdL4ghdD8rLTG3eYdOZb9g2uKSG5I root@MacBook-Pro-Natalia.local
            EOT
        }
      + name                      = "node02"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd85fbh332jqo6lq9j58"
              + name        = "root-node02"
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.12"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }
    }

  # yandex_compute_instance.node03 will be created
  + resource "yandex_compute_instance" "node03" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node03.netology.yc"
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8G8bK83RALbmsKdL4ghdD8rLTG3eYdOZb9g2uKSG5I root@MacBook-Pro-Natalia.local
            EOT
        }
      + name                      = "node03"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd85fbh332jqo6lq9j58"
              + name        = "root-node03"
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.13"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }
    }

  # yandex_compute_instance.node04 will be created
  + resource "yandex_compute_instance" "node04" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node04.netology.yc"
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8G8bK83RALbmsKdL4ghdD8rLTG3eYdOZb9g2uKSG5I root@MacBook-Pro-Natalia.local
            EOT
        }
      + name                      = "node04"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd85fbh332jqo6lq9j58"
              + name        = "root-node04"
              + size        = 40
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.14"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }
    }

  # yandex_compute_instance.node05 will be created
  + resource "yandex_compute_instance" "node05" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node05.netology.yc"
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8G8bK83RALbmsKdL4ghdD8rLTG3eYdOZb9g2uKSG5I root@MacBook-Pro-Natalia.local
            EOT
        }
      + name                      = "node05"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd85fbh332jqo6lq9j58"
              + name        = "root-node05"
              + size        = 40
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.15"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }
    }

  # yandex_compute_instance.node06 will be created
  + resource "yandex_compute_instance" "node06" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node06.netology.yc"
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8G8bK83RALbmsKdL4ghdD8rLTG3eYdOZb9g2uKSG5I root@MacBook-Pro-Natalia.local
            EOT
        }
      + name                      = "node06"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd85fbh332jqo6lq9j58"
              + name        = "root-node06"
              + size        = 40
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.16"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }
    }

  # yandex_vpc_network.default will be created
  + resource "yandex_vpc_network" "default" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "net"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.default will be created
  + resource "yandex_vpc_subnet" "default" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.101.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 13 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_node01 = (known after apply)
  + external_ip_address_node02 = (known after apply)
  + external_ip_address_node03 = (known after apply)
  + external_ip_address_node04 = (known after apply)
  + external_ip_address_node05 = (known after apply)
  + external_ip_address_node06 = (known after apply)
  + internal_ip_address_node01 = "192.168.101.11"
  + internal_ip_address_node02 = "192.168.101.12"
  + internal_ip_address_node03 = "192.168.101.13"
  + internal_ip_address_node04 = "192.168.101.14"
  + internal_ip_address_node05 = "192.168.101.15"
  + internal_ip_address_node06 = "192.168.101.16"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_network.default: Creating...
yandex_vpc_network.default: Creation complete after 5s [id=enp4773khtrkrv69kckh]
yandex_vpc_subnet.default: Creating...
yandex_vpc_subnet.default: Creation complete after 1s [id=e9blef1sah5va5ad74to]
yandex_compute_instance.node06: Creating...
yandex_compute_instance.node03: Creating...
yandex_compute_instance.node05: Creating...
yandex_compute_instance.node02: Creating...
yandex_compute_instance.node01: Creating...
yandex_compute_instance.node04: Creating...
yandex_compute_instance.node02: Still creating... [10s elapsed]
yandex_compute_instance.node03: Still creating... [10s elapsed]
yandex_compute_instance.node05: Still creating... [10s elapsed]
yandex_compute_instance.node06: Still creating... [10s elapsed]
yandex_compute_instance.node01: Still creating... [10s elapsed]
yandex_compute_instance.node04: Still creating... [10s elapsed]
yandex_compute_instance.node03: Still creating... [20s elapsed]
yandex_compute_instance.node02: Still creating... [20s elapsed]
yandex_compute_instance.node01: Still creating... [20s elapsed]
yandex_compute_instance.node05: Still creating... [20s elapsed]
yandex_compute_instance.node04: Still creating... [20s elapsed]
yandex_compute_instance.node06: Still creating... [20s elapsed]
yandex_compute_instance.node02: Still creating... [30s elapsed]
yandex_compute_instance.node06: Still creating... [30s elapsed]
yandex_compute_instance.node04: Still creating... [30s elapsed]
yandex_compute_instance.node01: Still creating... [30s elapsed]
yandex_compute_instance.node05: Still creating... [30s elapsed]
yandex_compute_instance.node03: Still creating... [30s elapsed]
yandex_compute_instance.node02: Creation complete after 40s [id=fhm920kn4rmd7fun89qt]
yandex_compute_instance.node01: Still creating... [40s elapsed]
yandex_compute_instance.node04: Still creating... [40s elapsed]
yandex_compute_instance.node05: Still creating... [40s elapsed]
yandex_compute_instance.node06: Still creating... [40s elapsed]
yandex_compute_instance.node03: Still creating... [40s elapsed]
yandex_compute_instance.node01: Creation complete after 41s [id=fhml6ag8582ic5r777a3]
yandex_compute_instance.node05: Creation complete after 44s [id=fhmbl5vgthiulmpn809n]
yandex_compute_instance.node06: Creation complete after 44s [id=fhmomv4fl03pb4l6l8j9]
yandex_compute_instance.node04: Creation complete after 47s [id=fhmtgcvagc4u5pkv6nk7]
yandex_compute_instance.node03: Creation complete after 47s [id=fhmik0ci1tutefcsb950]
local_file.inventory: Creating...
local_file.inventory: Creation complete after 0s [id=92d97667ff39d0bcb1d76617a88a6eba845109b9]
null_resource.wait: Creating...
null_resource.wait: Provisioning with 'local-exec'...
null_resource.wait (local-exec): Executing: ["/bin/sh" "-c" "sleep 100"]
null_resource.wait: Still creating... [10s elapsed]
null_resource.wait: Still creating... [20s elapsed]
null_resource.wait: Still creating... [30s elapsed]
null_resource.wait: Still creating... [40s elapsed]
null_resource.wait: Still creating... [50s elapsed]
null_resource.wait: Still creating... [1m0s elapsed]
null_resource.wait: Still creating... [1m10s elapsed]
null_resource.wait: Still creating... [1m20s elapsed]
null_resource.wait: Still creating... [1m30s elapsed]
null_resource.wait: Still creating... [1m40s elapsed]
null_resource.wait: Creation complete after 1m40s [id=8158137846916718401]
null_resource.cluster: Creating...
null_resource.cluster: Provisioning with 'local-exec'...
null_resource.cluster (local-exec): Executing: ["/bin/sh" "-c" "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/swarm-deploy-cluster.yml"]

null_resource.cluster (local-exec): PLAY [Install of Requrements Tools] ********************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster: Still creating... [10s elapsed]
null_resource.cluster (local-exec): ok: [node06.netology.yc]
null_resource.cluster (local-exec): ok: [node04.netology.yc]
null_resource.cluster (local-exec): ok: [node01.netology.yc]
null_resource.cluster (local-exec): ok: [node02.netology.yc]
null_resource.cluster (local-exec): ok: [node05.netology.yc]
null_resource.cluster (local-exec): ok: [node03.netology.yc]

null_resource.cluster (local-exec): TASK [install-tools : Installing tools] ****************************************
null_resource.cluster: Still creating... [20s elapsed]
null_resource.cluster: Still creating... [30s elapsed]
null_resource.cluster: Still creating... [40s elapsed]
null_resource.cluster: Still creating... [50s elapsed]
null_resource.cluster: Still creating... [1m0s elapsed]
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=python)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=python)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=python)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=python)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=python)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=wget)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=wget)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=wget)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=wget)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=wget)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=curl)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=curl)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=curl)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=curl)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=curl)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=git)
null_resource.cluster: Still creating... [1m10s elapsed]
null_resource.cluster: Still creating... [1m20s elapsed]
null_resource.cluster: Still creating... [1m30s elapsed]
null_resource.cluster: Still creating... [1m40s elapsed]
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=git)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=git)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=git)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=git)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=python)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=wget)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=curl)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=git)

null_resource.cluster (local-exec): TASK [configure-hosts-file : Configure Hosts File] *****************************
null_resource.cluster: Still creating... [1m50s elapsed]
null_resource.cluster: Still creating... [2m0s elapsed]
null_resource.cluster: Still creating... [2m10s elapsed]
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node03.netology.yc)
null_resource.cluster: Still creating... [2m20s elapsed]
null_resource.cluster: Still creating... [2m30s elapsed]
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node03.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node03.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node03.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node03.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node03.netology.yc)

null_resource.cluster (local-exec): PLAY [Install Docker Engine] ***************************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster (local-exec): ok: [node02.netology.yc]
null_resource.cluster (local-exec): ok: [node04.netology.yc]
null_resource.cluster (local-exec): ok: [node06.netology.yc]
null_resource.cluster (local-exec): ok: [node01.netology.yc]
null_resource.cluster (local-exec): ok: [node05.netology.yc]
null_resource.cluster (local-exec): ok: [node03.netology.yc]

null_resource.cluster (local-exec): TASK [docker-installation : Add docker repository] *****************************
null_resource.cluster: Still creating... [2m40s elapsed]
null_resource.cluster (local-exec): changed: [node02.netology.yc]
null_resource.cluster (local-exec): changed: [node06.netology.yc]
null_resource.cluster (local-exec): changed: [node05.netology.yc]
null_resource.cluster (local-exec): changed: [node01.netology.yc]
null_resource.cluster (local-exec): changed: [node04.netology.yc]
null_resource.cluster (local-exec): changed: [node03.netology.yc]

null_resource.cluster (local-exec): TASK [docker-installation : Installing docker package] *************************
null_resource.cluster: Still creating... [2m50s elapsed]
null_resource.cluster: Still creating... [3m0s elapsed]
null_resource.cluster: Still creating... [3m10s elapsed]
null_resource.cluster: Still creating... [3m20s elapsed]
null_resource.cluster: Still creating... [3m30s elapsed]
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=containerd.io)
null_resource.cluster: Still creating... [3m40s elapsed]
null_resource.cluster: Still creating... [3m50s elapsed]
null_resource.cluster: Still creating... [4m0s elapsed]
null_resource.cluster: Still creating... [4m10s elapsed]
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=containerd.io)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=containerd.io)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=containerd.io)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=containerd.io)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=containerd.io)

null_resource.cluster (local-exec): TASK [docker-installation : Enable docker daemon] ******************************
null_resource.cluster: Still creating... [4m20s elapsed]
null_resource.cluster: Still creating... [4m30s elapsed]
null_resource.cluster: Still creating... [4m40s elapsed]
null_resource.cluster: Still creating... [4m50s elapsed]
null_resource.cluster (local-exec): changed: [node02.netology.yc]
null_resource.cluster (local-exec): changed: [node06.netology.yc]
null_resource.cluster (local-exec): changed: [node05.netology.yc]
null_resource.cluster (local-exec): changed: [node01.netology.yc]
null_resource.cluster (local-exec): changed: [node04.netology.yc]
null_resource.cluster (local-exec): changed: [node03.netology.yc]

null_resource.cluster (local-exec): PLAY [Initialize Docker Swarm Cluster] *****************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster (local-exec): ok: [node01.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-init : Initialize Docker Swarm] *****************************
null_resource.cluster: Still creating... [5m0s elapsed]
null_resource.cluster (local-exec): changed: [node01.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-init : Get the Manager join-token] **************************
null_resource.cluster (local-exec): changed: [node01.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-init : Get the worker join-token] ***************************
null_resource.cluster (local-exec): changed: [node01.netology.yc]

null_resource.cluster (local-exec): PLAY [Add Managers Swarm Cluster] **********************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster: Still creating... [5m10s elapsed]
null_resource.cluster (local-exec): ok: [node02.netology.yc]
null_resource.cluster (local-exec): ok: [node03.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-add-manager : Add Managers to the Swarm] ********************
null_resource.cluster (local-exec): changed: [node03.netology.yc]
null_resource.cluster (local-exec): changed: [node02.netology.yc]

null_resource.cluster (local-exec): PLAY [Add Workers to the Swarm Cluster] ****************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster: Still creating... [5m20s elapsed]
null_resource.cluster (local-exec): ok: [node06.netology.yc]
null_resource.cluster (local-exec): ok: [node05.netology.yc]
null_resource.cluster (local-exec): ok: [node04.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-add-worker : Add Workers to the Swarm] **********************
null_resource.cluster (local-exec): changed: [node05.netology.yc]
null_resource.cluster (local-exec): changed: [node04.netology.yc]
null_resource.cluster (local-exec): changed: [node06.netology.yc]

null_resource.cluster (local-exec): PLAY RECAP *********************************************************************
null_resource.cluster (local-exec): node01.netology.yc         : ok=11   changed=8    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node02.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node03.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node04.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node05.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node06.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

null_resource.cluster: Creation complete after 5m27s [id=7658750341147678079]
null_resource.sync: Creating...
null_resource.sync: Provisioning with 'local-exec'...
null_resource.sync (local-exec): Executing: ["/bin/sh" "-c" "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/swarm-deploy-sync.yml"]

null_resource.sync (local-exec): PLAY [nodes] *******************************************************************

null_resource.sync (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.sync: Still creating... [10s elapsed]
null_resource.sync (local-exec): ok: [node02.netology.yc]
null_resource.sync (local-exec): ok: [node05.netology.yc]
null_resource.sync (local-exec): ok: [node01.netology.yc]
null_resource.sync (local-exec): ok: [node04.netology.yc]
null_resource.sync (local-exec): ok: [node06.netology.yc]
null_resource.sync (local-exec): ok: [node03.netology.yc]

null_resource.sync (local-exec): TASK [Synchronization] *********************************************************
null_resource.sync: Still creating... [20s elapsed]
null_resource.sync: Still creating... [30s elapsed]
null_resource.sync: Still creating... [40s elapsed]
null_resource.sync: Still creating... [50s elapsed]
null_resource.sync: Still creating... [1m0s elapsed]
null_resource.sync: Still creating... [1m10s elapsed]
null_resource.sync: Still creating... [1m20s elapsed]
null_resource.sync: Still creating... [1m30s elapsed]
null_resource.sync: Still creating... [1m40s elapsed]
null_resource.sync: Still creating... [1m50s elapsed]
null_resource.sync: Still creating... [2m0s elapsed]
null_resource.sync: Still creating... [2m10s elapsed]
null_resource.sync: Still creating... [2m20s elapsed]
null_resource.sync: Still creating... [2m30s elapsed]
null_resource.sync: Still creating... [2m40s elapsed]
null_resource.sync: Still creating... [2m50s elapsed]
null_resource.sync: Still creating... [3m0s elapsed]
null_resource.sync: Still creating... [3m10s elapsed]
null_resource.sync: Still creating... [3m20s elapsed]
null_resource.sync: Still creating... [3m30s elapsed]
null_resource.sync: Still creating... [3m40s elapsed]
null_resource.sync: Still creating... [3m50s elapsed]
null_resource.sync: Still creating... [4m0s elapsed]
null_resource.sync: Still creating... [4m10s elapsed]
null_resource.sync: Still creating... [4m20s elapsed]
null_resource.sync: Still creating... [4m30s elapsed]
null_resource.sync: Still creating... [4m40s elapsed]
null_resource.sync: Still creating... [4m50s elapsed]
null_resource.sync: Still creating... [5m0s elapsed]
null_resource.sync: Still creating... [5m10s elapsed]
null_resource.sync: Still creating... [5m20s elapsed]
null_resource.sync: Still creating... [5m30s elapsed]
null_resource.sync (local-exec): changed: [node02.netology.yc]
null_resource.sync (local-exec): changed: [node05.netology.yc]
null_resource.sync (local-exec): changed: [node06.netology.yc]
null_resource.sync (local-exec): changed: [node04.netology.yc]
null_resource.sync (local-exec): changed: [node01.netology.yc]
null_resource.sync (local-exec): changed: [node03.netology.yc]

null_resource.sync (local-exec): PLAY RECAP *********************************************************************
null_resource.sync (local-exec): node01.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node02.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node03.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node04.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node05.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node06.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

null_resource.sync: Creation complete after 5m37s [id=2674485988407598882]
null_resource.monitoring: Creating...
null_resource.monitoring: Provisioning with 'local-exec'...
null_resource.monitoring (local-exec): Executing: ["/bin/sh" "-c" "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/swarm-deploy-stack.yml --limit=managers"]

null_resource.monitoring (local-exec): PLAY [nodes] *******************************************************************

null_resource.monitoring (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.monitoring (local-exec): ok: [node03.netology.yc]
null_resource.monitoring (local-exec): ok: [node02.netology.yc]
null_resource.monitoring (local-exec): ok: [node01.netology.yc]

null_resource.monitoring (local-exec): TASK [Check Current Leader] ****************************************************
null_resource.monitoring: Still creating... [10s elapsed]
null_resource.monitoring (local-exec): ok: [node01.netology.yc]
null_resource.monitoring (local-exec): ok: [node03.netology.yc]
null_resource.monitoring (local-exec): ok: [node02.netology.yc]

null_resource.monitoring (local-exec): TASK [Run deploy, if node is leader] *******************************************
null_resource.monitoring: Still creating... [20s elapsed]
null_resource.monitoring: Still creating... [30s elapsed]
null_resource.monitoring: Still creating... [40s elapsed]
null_resource.monitoring (local-exec): skipping: [node02.netology.yc]
null_resource.monitoring (local-exec): skipping: [node03.netology.yc]
null_resource.monitoring (local-exec): changed: [node01.netology.yc]

null_resource.monitoring (local-exec): PLAY RECAP *********************************************************************
null_resource.monitoring (local-exec): node01.netology.yc         : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.monitoring (local-exec): node02.netology.yc         : ok=2    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
null_resource.monitoring (local-exec): node03.netology.yc         : ok=2    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

null_resource.monitoring: Creation complete after 47s [id=7560563299751162555]

Apply complete! Resources: 13 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_node01 = "158.160.121.128"
external_ip_address_node02 = "158.160.32.18"
external_ip_address_node03 = "158.160.98.244"
external_ip_address_node04 = "158.160.97.210"
external_ip_address_node05 = "158.160.105.46"
external_ip_address_node06 = "158.160.110.188"
internal_ip_address_node01 = "192.168.101.11"
internal_ip_address_node02 = "192.168.101.12"
internal_ip_address_node03 = "192.168.101.13"
internal_ip_address_node04 = "192.168.101.14"
internal_ip_address_node05 = "192.168.101.15"
internal_ip_address_node06 = "192.168.101.16"

[centos@node01 ~]$ sudo docker service ls
ID             NAME                                MODE         REPLICAS   IMAGE                                          PORTS
smrza3in9a2k   swarm_monitoring_alertmanager       replicated   1/1        stefanprodan/swarmprom-alertmanager:v0.14.0    
mywf1axc8752   swarm_monitoring_caddy              replicated   1/1        stefanprodan/caddy:latest                      *:3000->3000/tcp, *:9090->9090/tcp, *:9093-9094->9093-9094/tcp
2xvks5qadv2r   swarm_monitoring_cadvisor           global       6/6        google/cadvisor:latest                         
se9pps71qeiz   swarm_monitoring_dockerd-exporter   global       6/6        stefanprodan/caddy:latest                      
mz6hqpamd9rx   swarm_monitoring_grafana            replicated   1/1        stefanprodan/swarmprom-grafana:5.3.4           
mvnlsmuhqmpe   swarm_monitoring_node-exporter      global       6/6        stefanprodan/swarmprom-node-exporter:v0.16.0   
2dj1fk7no1nr   swarm_monitoring_prometheus         replicated   1/1        stefanprodan/swarmprom-prometheus:v2.5.0       
s5t5cxewfzp3   swarm_monitoring_unsee              replicated   1/1        cloudflare/unsee:v0.8.0                        

[centos@node01 ~]$ curl http://158.160.121.128:3000
<a href="/login">Found</a>.



````


