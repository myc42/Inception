SRC_DIR := ./srcs
COMPOSE := docker compose -f $(SRC_DIR)/docker-compose.yml

all: help

build:
	$(COMPOSE) up -d --build

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

restart:
	$(COMPOSE)  up -d

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

clean:
	$(COMPOSE) down

fclean:
	$(COMPOSE) down --volumes --rmi all --remove-orphans

re: fclean build

help:
	@echo "Makefile - Docker Compose"
	@echo ""
	@echo "Commandes disponibles :"
	@echo "  make build"
	@echo "  make up"
	@echo "  make down"
	@echo "  make restart"
	@echo "  make logs"
	@echo "  make ps"
	@echo "  make clean"
	@echo "  make fclean"
	@echo "  make re"

.PHONY: all build up down restart logs ps clean fclean re help