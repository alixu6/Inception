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
ENV = ./srcs/.env

NAME = Inception

all: $(NAME)

$(ENV):
	@if [ ! -f ./srcs/.env ]; then \
		cp ~/.env ./srcs/; \
	fi

$(NAME): $(ENV)
	mkdir -p ~/data/mariadb ~/data/wordpress
	cp ~/.env ./srcs/
	$(DOCKER_COMPOSE) up --build -d

up: $(ENV)
	$(DOCKER_COMPOSE) up -d

down: $(ENV)
	$(DOCKER_COMPOSE) down

clean: $(ENV)
	$(DOCKER_COMPOSE) stop
#	$(DOCKER_COMPOSE) down --remove-orphans || true
#	$(DOCKER) system prune -f || true

fclean: clean
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans || true
	$(DOCKER) system prune -a --volumes -f || true
#	$(DOCKER) network prune -f || true
	rm -f ./srcs/.env 
	sudo rm -rf ~/data/mariadb ~/data/wordpress

start: $(ENV)
	$(DOCKER_COMPOSE) start

logs: $(ENV)
	$(DOCKER_COMPOSE) logs -f

ps:
	$(DOCKER) ps -a

images:
	$(DOCKER) images

network:
	$(DOCKER) network ls

volume:
	$(DOCKER) volume ls

check: ps images network volume

re: fclean all

