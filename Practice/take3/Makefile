all:

	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

up:
	docker compose -f srcs/docker-compose.yml up -d

clean:
	docker compose -f srcs/docker-compose.yml down
	docker rmi -f $$(docker images -qa)
	docker volume rm $$(docker volume ls -q)

fclean: clean prune
	sudo rm -rf /home/bwong/data/wordpress/*
	sudo rm -rf /home/bwong/data/mariadb/*

re: clean all

prune:
	yes | docker system prune -a --volumes
