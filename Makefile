all:

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker system prune -f 

fclean:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all

re: clean
	docker-compose -f srcs/docker-compose.yml up --build

start:
	docker-compose -f srcs/docker-compose.yml up --build

.PHONY: all start stop clean re fclean

