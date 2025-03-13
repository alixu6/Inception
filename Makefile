# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: axu <axu@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/25 14:50:20 by axu               #+#    #+#              #
#    Updated: 2025/02/10 14:40:52 by axu              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE = docker compose -f srcs/docker-compose.yml
DOCKER = docker

PROJECT_NAME = Inception

build:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress
	cp /home/${USER}/.env ./srcs/.env
	$(DOCKER_COMPOSE) up --build -d

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans || true
	$(DOCKER) system prune -a --volumes -f || true
	rm ./srcs/.env
	sudo rm -rf ~/data/mariadb
	sudo rm -rf ~/data/wordpress

restart: down up

logs:
	$(DOCKER_COMPOSE) logs -f

ps:
	$(DOCKER) ps -a

images:
	$(DOCKER) images

all: build