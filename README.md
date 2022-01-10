# Gogen120_microservices
Gogen120 microservices repository

## Docker 1

* Создал docker образ и загрузил его в dockerhub - `gogen120/otus-reddit:1.0`
* С помощью `docker-machine` запустил на виртуальной машине yandex-а контейнер с приложением
* Добавил terraform манифесты, ansible плейбуки, шаблоны пакера для запуска и конфигурирования приложения в докере

## Docker 3
* Добавил докерфайлы для отдельных микросервисов, необходимых для запуска reddit приложения
* Сжал образы микросервисов с помощью alpine образов

## Docker 4
* Добавил `docker-compose` файл с описанием микросервисов и сетей
* Параметризовал некоторыые переменные для `docker-compose` файла
* Добавил переменную `COMPOSE_PROJECT_NAME`, с помощью которой можно изменять префиксы контенеров
* Добавил `docker-compose.override` файл с монтированием директорий (чтобы код был доступен приложению) и запуском `puma` в дебаг режиме с двумя воркерами

## Gitlab-CI
* Добавил terraform манифесты для создания VM
* Добавил ansible плейбуки для уствановки докера и gitlab-а
* Добавил gitlab ci пайплайн для сборки, тестирования и деплоя на различные окружения

## Monitoring
* Описал в `docker-compose` файле `prometheus`, `node-exporter`, `mongodb-exporter` и `blackbox-exporter`
* Запушил образы микросервисов, прометеуса и экспортеров в [docker-hub](https://hub.docker.com/u/gogen120)
* Добавил `Makefile` для сборки образов (build) и их пуша в docker-hub (push)

## Logging
* Добавил контейнеры для логирования приложения (`elasticsearch`, `kibana`, `fluentd`)
* Подключил логирование для микросервисов reddit-а
* Добавил парсинг логов для `post` сервиса и для `ui` сервиса
* Добавил сервис для распределенного трейсинга (`zipkin`)
* Подключил `zipkin` для микросервисов reddit-а
* Проанализировал приложение со сломанным кодом с помощью `zipkin`: проблема заключается в вызове `time.sleep(3)` в функции `find_post` в `post` микросервисе
