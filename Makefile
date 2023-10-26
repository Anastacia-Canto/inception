
all: up

up: setup
	sudo docker compose -f ./srcs/docker-compose.yml up --build

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

setup:
	# chmod 755 ./tools/hostconfig.sh
	# ./tools/hostconfig.sh
	sudo mkdir -p /home/ansilva-/data
	sudo mkdir -p /home/ansilva-/data/mysql
	sudo mkdir -p /home/ansilva-/data/wordpress

clean:
	sudo docker system prune -f -a --volumes

re: clean all

.PHONY: all up setup clean