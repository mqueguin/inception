all: start

stop:
	docker compose -f srcs/docker-compose.yml stop

clean:
	docker system prune -f
	@docker volume prune
	sudo rm -rf ~/data

fclean: clean
	docker compose -f srcs/docker-compose.yml down -v --rmi all

re: clean
	docker compose -f srcs/docker-compose.yml up --build

start:
	@sudo mkdir -p /home/mqueguin/data/database && sudo mkdir -p /home/mqueguin/data/wordpress
	docker compose -f srcs/docker-compose.yml up --build

.PHONY: all start stop clean re fclean
