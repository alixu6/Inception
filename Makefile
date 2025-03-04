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

NAME = PmergeMe
SOURCES = main.cpp PmergeMe.cpp
OBJECTS = $(SOURCES:.cpp=.o)

CC = c++
FLAGS = -Wall -Wextra -Werror -std=c++98

all:$(NAME)

$(NAME): $(OBJECTS)
	$(CC) $(FLAGS) -o $@ $(OBJECTS)

%.o: %.cpp
	$(CC) $(FLAGS) -c -o $@ $<

clean:
	rm -f $(OBJECTS)

fclean: clean
		rm -f $(NAME)

re: fclean all