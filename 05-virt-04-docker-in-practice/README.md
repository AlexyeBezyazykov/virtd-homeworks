# Домашнее задание к занятию 5. «Практическое применение Docker»

### Инструкция к выполнению

1. Для выполнения заданий обязательно ознакомьтесь с [инструкцией](https://github.com/netology-code/devops-materials/blob/master/cloudwork.MD) по экономии облачных ресурсов. Это нужно, чтобы не расходовать средства, полученные в результате использования промокода.
3. **Своё решение к задачам оформите в вашем GitHub репозитории.**
4. В личном кабинете отправьте на проверку ссылку на .md-файл в вашем репозитории.
5. Сопроводите ответ необходимыми скриншотами.

---
## Примечание: Ознакомьтесь со схемой виртуального стенда [по ссылке](https://github.com/netology-code/shvirtd-example-python/blob/main/schema.pdf)

---

## Задача 0
1. Убедитесь что у вас НЕ(!) установлен ```docker-compose```, для этого получите следующую ошибку от команды ```docker-compose --version```
```
Command 'docker-compose' not found, but can be installed with:

sudo snap install docker          # version 24.0.5, or
sudo apt  install docker-compose  # version 1.25.0-1

See 'snap info docker' for additional versions.
```
В случае наличия установленного в системе ```docker-compose``` - удалите его.  
2. Убедитесь что у вас УСТАНОВЛЕН ```docker compose```(без тире) версии не менее v2.24.X, для это выполните команду ```docker compose version```  
###  **Своё решение к задачам оформите в вашем GitHub репозитории!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!**

---

## Задача 1
1. Сделайте в своем github пространстве fork репозитория ```https://github.com/netology-code/shvirtd-example-python/blob/main/README.md```.   
2. Создайте файл с именем ```Dockerfile.python``` для сборки данного проекта(для 3 задания изучите https://docs.docker.com/compose/compose-file/build/ ). Используйте базовый образ ```python:3.9-slim```. Протестируйте корректность сборки. Не забудьте dockerignore. 
3. (Необязательная часть, *) Изучите инструкцию в проекте и запустите web-приложение без использования docker в venv. (Mysql БД можно запустить в docker run).
4. (Необязательная часть, *) По образцу предоставленного python кода внесите в него исправление для управления названием используемой таблицы через ENV переменную.
---
### ВНИМАНИЕ!
!!! В процессе последующего выполнения ДЗ НЕ изменяйте содержимое файлов в fork-репозитории! Ваша задача ДОБАВИТЬ 5 файлов: ```Dockerfile.python```, ```compose.yaml```, ```.gitignore```, ```.dockerignore```,```bash-скрипт```. Если вам понадобилось внести иные изменения в проект - вы что-то делаете неверно!
---

## Задача 2 (*)
1. Создайте в yandex cloud container registry с именем "test" с помощью "yc tool" . [Инструкция](https://cloud.yandex.ru/ru/docs/container-registry/quickstart/?from=int-console-help)
2. Настройте аутентификацию вашего локального docker в yandex container registry.
3. Соберите и залейте в него образ с python приложением из задания №1.
4. Просканируйте образ на уязвимости.
5. В качестве ответа приложите отчет сканирования.

## Задача 3
1. Изучите файл "proxy.yaml"
2. Создайте в репозитории с проектом файл ```compose.yaml```. С помощью директивы "include" подключите к нему файл "proxy.yaml".
3. Опишите в файле ```compose.yaml``` следующие сервисы: 

- ```web```. Образ приложения должен ИЛИ собираться при запуске compose из файла ```Dockerfile.python``` ИЛИ скачиваться из yandex cloud container registry(из задание №2 со *). Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.5```. Сервис должен всегда перезапускаться в случае ошибок.
Передайте необходимые ENV-переменные для подключения к Mysql базе данных по сетевому имени сервиса ```web``` 

- ```db```. image=mysql:8. Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.10```. Явно перезапуск сервиса в случае ошибок. Передайте необходимые ENV-переменные для создания: пароля root пользователя, создания базы данных, пользователя и пароля для web-приложения.Обязательно используйте уже существующий .env file для назначения секретных ENV-переменных!

2. Запустите проект локально с помощью docker compose , добейтесь его стабильной работы: команда ```curl -L http://127.0.0.1:8090``` должна возвращать в качестве ответа время и локальный IP-адрес. Если сервисы не стартуют воспользуйтесь командами: ```docker ps -a ``` и ```docker logs <container_name>``` 

5. Подключитесь к БД mysql с помощью команды ```docker exec <имя_контейнера> mysql -uroot -p<пароль root-пользователя>``` . Введите последовательно команды (не забываем в конце символ ; ): ```show databases; use <имя вашей базы данных(по-умолчанию example)>; show tables; SELECT * from requests LIMIT 10;```.

6. Остановите проект. В качестве ответа приложите скриншот sql-запроса.
![3](https://github.com/AlexyeBezyazykov/virtd-homeworks/blob/shvirtd-1/05-virt-04-docker-in-practice/Mozilla%20Firefox%202024-08-26%2023-46-11.png)
![1](https://github.com/AlexyeBezyazykov/virtd-homeworks/blob/shvirtd-1/05-virt-04-docker-in-practice/virt%20%E2%80%93%20virt%20%E2%80%93%20.env%202024-08-22%2017-21-22.png%202024-08-26%2023-57-40.png)

## Задача 4
1. Запустите в Yandex Cloud ВМ (вам хватит 2 Гб Ram).
2. Подключитесь к Вм по ssh и установите docker.
3. Напишите bash-скрипт, который скачает ваш fork-репозиторий в каталог /opt и запустит проект целиком.
4. Зайдите на сайт проверки http подключений, например(или аналогичный): ```https://check-host.net/check-http``` и запустите проверку вашего сервиса ```http://<внешний_IP-адрес_вашей_ВМ>:8090```. Таким образом трафик будет направлен в ingress-proxy.
5. (Необязательная часть) Дополнительно настройте remote ssh context к вашему серверу. Отобразите список контекстов и результат удаленного выполнения ```docker ps -a```
6. В качестве ответа повторите  sql-запрос и приложите скриншот с данного сервера, bash-скрипт и ссылку на fork-репозиторий.

```
https://github.com/AlexyeBezyazykov/shvirtd-example-python
```
![2](https://github.com/AlexyeBezyazykov/virtd-homeworks/blob/shvirtd-1/05-virt-04-docker-in-practice/%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D0%B2%D0%B5%D0%B1-%D1%81%D0%B0%D0%B9%D1%82%D0%B0%20%D0%BD%D0%B0%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%D0%B8%20%D1%81%D0%BA%D0%BE%D1%80%D0%BE%D1%81%D1%82%D1%8C%20%D0%BE%D1%82%D0%BA%D0%BB%D0%B8%D0%BA%D0%B0%20%3A%20Check%20host%20-%20%D0%BE%D0%BD%D0%BB%D0%B0%D0%B9%D0%BD%20%D0%BC%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3%20%D0%B2%D0%B5%D0%B1-%D1%81%D0%B0%D0%B9%D1%82%D0%B0%202024-08-26%2023-40-44.png)

```
https://github.com/AlexyeBezyazykov/shvirtd-example-python/blob/main/bash.sh
```

## Задача 5 (*)
1. Напишите и задеплойте на вашу облачную ВМ bash скрипт, который произведет резервное копирование БД mysql в директорию "/opt/backup" с помощью запуска в сети "backend" контейнера из образа ```schnitzler/mysqldump``` при помощи ```docker run ...``` команды. Подсказка: "документация образа."
2. Протестируйте ручной запуск
3. Настройте выполнение скрипта раз в 1 минуту через cron, crontab или systemctl timer. Придумайте способ не светить логин/пароль в git!!
4. Предоставьте скрипт, cron-task и скриншот с несколькими резервными копиями в "/opt/backup"

## Задача 6
Скачайте docker образ ```hashicorp/terraform:latest``` и скопируйте бинарный файл ```/bin/terraform``` на свою локальную машину, используя dive и docker save.
Предоставьте скриншоты  действий .

(venv) natalia@ilo-srv-irk virt % docker save  hashicorp/terraform -o terraform.tar
(venv) natalia@ilo-srv-irk virt % ls
terraform.tar   virtd-homeworks
(venv) natalia@ilo-srv-irk virt % tar -xf terraform.tar 
(venv) natalia@ilo-srv-irk virt % ls
blobs           index.json      manifest.json   oci-layout      repositories    terraform.tar   virtd-homeworks
(venv) natalia@ilo-srv-irk virt % cd blobs             
(venv) natalia@ilo-srv-irk blobs % ls
sha256
(venv) natalia@ilo-srv-irk blobs % cd sha256 
(venv) natalia@ilo-srv-irk sha256 % ls
00f5a6fc49eddbbfbd3925b9d6110273e71fa28780fcca61c5d9aa6ca3083128        8b5ed351364e4e5f1f9d23275718122ca5db832cbbd26afbc4687aba0b80bbb9
08b096d423eb3e0fad56ca2d09548a576ddb01f6065b6fb88ab6470a8ea5391d        909a9d4540ae30aa72461faadc22cd0282816b376716edee3fda49f2c5cd5aee
2e4c7a391cbe470bdd510791978859db7e09e412dc2587c5b27451aef764cf1b        9fcd62ce020e4ae7338436e57648ddeb786e86b279a507ed068f23bfe4f9874e
3aac1ffd9c0e58b47f5c3e9985b6e9cb4b402fd4694569a943cde6c5453bd337        f7542cfaa07606be31b36695a9ffeae7fe5dd6bbe601133f6055c0b4e3d353d1
78561cef0761903dd2f7d09856150a6d4fb48967a8f113f3e33d79effbf59a07        ff050fba86f4a348141841cc7d9ebc8619dc77478ea215330000b3159151aac7

virt – README.md 2024-08-27 00-32-52

(venv) natalia@ilo-srv-irk sha256 % tar -xf 2e4c7a391cbe470bdd510791978859db7e09e412dc2587c5b27451aef764cf1b
(venv) natalia@ilo-srv-irk sha256 % ls
00f5a6fc49eddbbfbd3925b9d6110273e71fa28780fcca61c5d9aa6ca3083128        909a9d4540ae30aa72461faadc22cd0282816b376716edee3fda49f2c5cd5aee
08b096d423eb3e0fad56ca2d09548a576ddb01f6065b6fb88ab6470a8ea5391d        9fcd62ce020e4ae7338436e57648ddeb786e86b279a507ed068f23bfe4f9874e
2e4c7a391cbe470bdd510791978859db7e09e412dc2587c5b27451aef764cf1b        bin
3aac1ffd9c0e58b47f5c3e9985b6e9cb4b402fd4694569a943cde6c5453bd337        f7542cfaa07606be31b36695a9ffeae7fe5dd6bbe601133f6055c0b4e3d353d1
78561cef0761903dd2f7d09856150a6d4fb48967a8f113f3e33d79effbf59a07        ff050fba86f4a348141841cc7d9ebc8619dc77478ea215330000b3159151aac7
8b5ed351364e4e5f1f9d23275718122ca5db832cbbd26afbc4687aba0b80bbb9
(venv) natalia@ilo-srv-irk sha256 % cd bin
(venv) natalia@ilo-srv-irk bin % ls
terraform
(venv) natalia@ilo-srv-irk bin % 


## Задача 6.1
Добейтесь аналогичного результата, используя docker cp.  
Предоставьте скриншоты  действий .

virt – README.md 2024-08-27 00-52-49

## Задача 6.2 (**)
Предложите способ извлечь файл из контейнера, используя только команду docker build и любой Dockerfile.  
Предоставьте скриншоты  действий .

## Задача 7 (***)
Запустите ваше python-приложение с помощью runC, не используя docker или containerd.  
Предоставьте скриншоты  действий .
