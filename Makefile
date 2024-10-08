# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fvon-der <fvon-der@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/08 14:52:11 by fvon-der          #+#    #+#              #
#    Updated: 2024/10/08 19:34:28 by fvon-der         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ================================
# Color Definitions
# ================================
RESET_COLOR = \033[0;39m
YELLOW      = \033[0;93m
BLUE        = \033[0;94m
GREEN       = \033[0;92m
RED         = \033[1;31m

# ================================
# Compiler and Flags
# ================================
CC      = cc
NAME    = libft.a
CFLAGS  = -Wall -Wextra -Werror -I. -Iinclude

# ================================
# Directories
# ================================
SRC_DIR      = src/libft
OBJ_DIR      = obj/libft
BONUS_SRC_DIR = src/bonus
BONUS_OBJ_DIR = obj/bonus

# ================================
# Source and Object Files
# ================================
SRC         = $(wildcard $(SRC_DIR)/*.c)
OBJ         = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))

BONUS_SRC   = $(wildcard $(BONUS_SRC_DIR)/*.c)
BONUS_OBJ   = $(patsubst $(BONUS_SRC_DIR)/%.c,$(BONUS_OBJ_DIR)/%.o,$(BONUS_SRC))

# ================================
# Rules for Directories
# ================================
$(OBJ_DIR) $(BONUS_OBJ_DIR):
	@mkdir -p $@

# ================================
# Compile Source Files
# ================================
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "$(YELLOW)LIBFT object compiling: $<$(RESET_COLOR)"

$(BONUS_OBJ_DIR)/%.o: $(BONUS_SRC_DIR)/%.c | $(BONUS_OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "$(YELLOW)LIBFT BONUS object compiling: $<$(RESET_COLOR)"

# ================================
# Build the Library
# ================================
$(NAME): $(OBJ) $(BONUS_OBJ)
	@ar cr $(NAME) $(OBJ) $(BONUS_OBJ)
	@echo "$(GREEN)libft library created!$(RESET_COLOR)"

# ================================
# Targets
# ================================
all: $(NAME)

bonus: $(BONUS_OBJ)
	@ar cr $(NAME) $(BONUS_OBJ) $(OBJ)
	@echo "$(GREEN)BONUS libft library created!$(RESET_COLOR)"

# ================================
# Cleanup Targets
# ================================
clean:
	@rm -f $(OBJ) $(BONUS_OBJ)
	@echo "$(RED)LIBFT object files removed!$(RESET_COLOR)"

fclean: clean
	@rm -f $(NAME)
	@echo "$(RED)LIBFT library removed!$(RESET_COLOR)"

re: fclean all
	@echo "$(BLUE)LIBFT library rebuilt!$(RESET_COLOR)"

# ================================
# Phony Targets
# ================================
.PHONY: all clean fclean re bonus
