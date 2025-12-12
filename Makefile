.PHONY: all down fclean re up build dirs

all: build up

build: dirs
	@echo "Building all images..."
	docker compose -f srcs/docker-compose.yml build

up:
	@echo "Starting containers..."
	docker compose -f srcs/docker-compose.yml up

down:
	@echo "Stopping and removing containers and named volumes..."
	docker compose -f srcs/docker-compose.yml down -v

fclean: down
	@echo "Removing all unused Docker data (images, volumes, cache)..."
	docker system prune -af
	# Suppression du contenu des bind mounts (après avoir supprimé les conteneurs)
	sudo rm -rf ~/data/mariadb
	sudo rm -rf ~/data/wordpress

dirs:
	@echo "Creating necessary host directories: ~/data/mariadb and ~/data/wordpress..."
	sudo mkdir -p ~/data/mariadb
	sudo mkdir -p ~/data/wordpress

re: fclean build up