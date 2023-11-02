
all: up

up: setup
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

setup:
	mkdir -p /home/ansilva-/data
	mkdir -p /home/ansilva-/data/mysql
	mkdir -p /home/ansilva-/data/wordpress
	# chmod 755 /home/ansilva-/data/mysql
	# chmod 755 /home/ansilva-/data/wordpress

clean: down
	sudo rm -rf /home/ansilva-/data/mysql/* /home/ansilva-/data/wordpress/*
	docker builder prune
	docker system prune -f -a --volumes

re: clean all

.PHONY: all up setup clean