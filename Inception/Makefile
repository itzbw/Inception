all:
	sudo mkdir -p /home/bwong/data/wordpress/
	sudo mkdir -p /home/bwong/data/mariadb/
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

restart:
	docker compose -f srcs/docker-compose.yml stop
	docker compose -f srcs/docker-compose.yml start

clean: clean prune
	docker rm -f $$(docker ps -qa)
	docker volume rm $$(docker volume ls -q)
	sudo rm -rf /home/bwong/data/wordpress/*
	sudo rm -rf /home/bwong/data/mariadb/*

re: clean all

prune:
	yes | docker system prune -a --volumes

.PHONY: all clean fclean re
