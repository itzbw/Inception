all:
	sudo mkdir -p /home/bwong/data/wordpress/
	sudo mkdir -p /home/bwong/data/mariadb/
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	sudo rm -rf /home/bwong/data/wordpress/*
	sudo rm -rf /home/bwong/data/mariadb/*
	docker system prune -a -f

re: clean all

.PHONY: all clean fclean re
