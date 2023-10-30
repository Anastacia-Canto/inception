
all: up

up: setup
	sudo docker compose -f ./srcs/docker-compose.yml up --build

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

setup:
	sudo mkdir -p /home/ansilva-/data
	sudo mkdir -p /home/ansilva-/data/mysql
	sudo mkdir -p /home/ansilva-/data/wordpress
	sudo chmod 755 /home/ansilva-/data/mysql
	sudo chmod 755 /home/ansilva-/data/wordpress

clean:
	sudo docker builder prune
	sudo docker system prune -f -a --volumes

re: clean all

.PHONY: all up setup clean