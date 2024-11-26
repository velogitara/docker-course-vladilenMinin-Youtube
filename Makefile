# Makefile позволяет создать шорткаты для консольных команд
# Установка (от админа): choco install make

# make build
build:
	docker build -t velogitara/logsapp .
# make run
run:
	docker run -d -p 80:3000 -v logs:/app/data  --rm --name  logsapp velogitara/logsapp:volumes
# make stop
stop:
	docker stop logsapp
# make run-volume
run-volume:
	docker run -d -p 3000:3000 -v logs:/app/data --rm --name logsapp logsapp
# make run-volume-dev
# -v "D:\PROG\[projects]\logs-app:/app" - благодаря этому, изменяя и сохраняя исходный код, мы влияем на то,
# что работает в контейнере, потому что он теперь берёт код отсюда - там где мы его пишем.
# Эдакий запуск в режиме разработки
run-volume-dev:
	docker run -d -p 80:3000 -v "C:\projects\docker-Course-Minin\docker-test-vladilenm-logs-app:/app" -v /app/node_modules -v newlogs:/app/data --rm --name logsapp velogitara/logsapp:volumes
run-env:
	docker run -d -p 3000:3000 --env-file ./config/.env --rm --name logsapp logsapp

	