# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: csummers <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/21 14:37:39 by csummers          #+#    #+#              #
#    Updated: 2016/11/21 14:37:40 by csummers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ft_ls
CC = gcc

SRC = 			ft_ls.c \
				ls_flag_functions.c \
				ls_argv_helper.c \
				ls_helper_functions.c \
				ls_sort_functions.c \
				ls_comparison_functions.c \
				ls_dir_functions.c \
				ls_lprint_functions.c \
				ls_lprint_helper.c

SRC_DIR = ./srcs/
BUILD_DIR = ./build/

SRC_FILES = $(addprefix $(SRC_DIR),$(SRC))
OBJ_FILES = $(addprefix $(BUILD_DIR),$(SRC:.c=.o))

HDR = -I./includes
LIB = -L./libft -lft

CFLAGS = -Wall -Wextra -Werror

.PHONY: all lib clean fclean re

all: $(NAME)

build:
	mkdir $(BUILD_DIR)

lib:
	make -C libft

$(BUILD_DIR)%.o: $(SRC_DIR)%.c | build
	$(CC) $(CFLAGS) $(HDR) -c $< -o $@

$(NAME): $(OBJ_FILES) | lib
	$(CC) $(CFLAGS) $(HDR) $(LIB) $(OBJ_FILES) -o $(NAME)

clean:
	rm -rf ./build/
	make clean -C ./libft

fclean: clean
	rm -f $(NAME)
	make fclean -C ./libft

re: fclean all
