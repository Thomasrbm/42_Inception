all:
	docker compose -f srcs/docker-compose.yml up --build

down:
	docker compose -f srcs/docker-compose.yml down -v

clean:
	docker system prune -a

re: down all
