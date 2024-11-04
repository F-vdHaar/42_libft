# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fvon-der <fvon-der@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/08 14:52:11 by fvon-der          #+#    #+#              #
#    Updated: 2024/11/04 16:36:42 by fvon-der         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors for output
RESET_COLOR	= \033[0m
YELLOW		= \033[1;33m
BLUE		= \033[1;34m
GREEN		= \033[1;32m
RED			= \033[1;31m

# Compiler and Flags
cc			= cc
NAME		= libft.a
CFLAGS		= -Wall -Wextra -Werror -I $(INCLUDE)
DEBUG_FLAGS = $(CFLAGS) -g -O0 -fsanitize=address -fsanitize=undefined \
			-fno-strict-aliasing -fno-omit-frame-pointer -fstack-protector -DDEBUG -fno-inline
AR			= ar rcs

# Directories
OBJ_DIR		= obj
SRC_DIR		= src
INCLUDE		= include

# Source files
SRCS =	$(SRC_DIR)/ft_atoi.c $(SRC_DIR)/ft_bzero.c $(SRC_DIR)/ft_calloc.c $(SRC_DIR)/ft_isalnum.c \
		$(SRC_DIR)/ft_isalpha.c $(SRC_DIR)/ft_isascii.c $(SRC_DIR)/ft_isdigit.c $(SRC_DIR)/ft_isprint.c \
		$(SRC_DIR)/ft_itoa.c $(SRC_DIR)/ft_memchr.c $(SRC_DIR)/ft_memcmp.c $(SRC_DIR)/ft_memcpy.c \
		$(SRC_DIR)/ft_memmove.c $(SRC_DIR)/ft_memset.c $(SRC_DIR)/ft_putchar_fd.c $(SRC_DIR)/ft_putendl_fd.c \
		$(SRC_DIR)/ft_putnbr_fd.c $(SRC_DIR)/ft_putstr_fd.c $(SRC_DIR)/ft_split.c $(SRC_DIR)/ft_strchr.c \
		$(SRC_DIR)/ft_strdup.c $(SRC_DIR)/ft_striteri.c $(SRC_DIR)/ft_strjoin.c $(SRC_DIR)/ft_strlcat.c \
		$(SRC_DIR)/ft_strlcpy.c $(SRC_DIR)/ft_strlen.c $(SRC_DIR)/ft_strmapi.c $(SRC_DIR)/ft_strncmp.c \
		$(SRC_DIR)/ft_strnstr.c $(SRC_DIR)/ft_strrchr.c $(SRC_DIR)/ft_strtrim.c $(SRC_DIR)/ft_substr.c \
		$(SRC_DIR)/ft_tolower.c $(SRC_DIR)/ft_toupper.c $(SRC_DIR)/ft_lstadd_back_bonus.c \
		$(SRC_DIR)/ft_lstadd_front_bonus.c $(SRC_DIR)/ft_lstclear_bonus.c $(SRC_DIR)/ft_lstdelone_bonus.c \
		$(SRC_DIR)/ft_lstiter_bonus.c $(SRC_DIR)/ft_lstlast_bonus.c $(SRC_DIR)/ft_lstmap_bonus.c \
		$(SRC_DIR)/ft_lstnew_bonus.c $(SRC_DIR)/ft_lstsize_bonus.c

# Define object files
OBJS = $(addprefix $(OBJ_DIR)/, $(notdir $(SRCS:.c=.o)))

# Debug object files
DEBUG_OBJS = $(addprefix $(OBJ_DIR)/, $(addprefix debug_, $(notdir $(SRCS:.c=.o))))

# Default rule to build
all: $(NAME)
	@echo "$(GREEN)LIBFT : Compilation complete!$(RESET_COLOR)"

# Bonus target
bonus: all

# Create the library
$(NAME): $(OBJS)
	@echo "$(GREEN)LIBFT : Creating library $(NAME)...$(RESET_COLOR)"
	@$(AR) $(NAME) $(OBJS)

# Debug build
debug: $(DEBUG_OBJS)
	@echo "$(YELLOW)LIBFT : Creating debug library debug.a...$(RESET_COLOR)"
	@$(AR) debug.a $(DEBUG_OBJS)
	@echo "$(GREEN)LIBFT : Debug library debug.a created!$(RESET_COLOR)"

# Norminette check
norm:
	@echo "$(BLUE)LIBFT : Running Norminette...$(RESET_COLOR)"
	@norminette $(SRCS) | grep -v 'OK!' || true
	@echo "$(GREEN)LIBFT : Norminette check complete!$(RESET_COLOR)"

# Ensure object directory exists
$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

# Compile source files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@echo "$(YELLOW)LIBFT : Compiling $< into $@...$(RESET_COLOR)"
	@$(CC) $(CFLAGS) -c $< -o $@

# Compile debug source files
$(OBJ_DIR)/debug_%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@echo "$(YELLOW)LIBFT : Compiling $< into debug $@...$(RESET_COLOR)"
	@$(CC) $(DEBUG_FLAGS) -c $< -o $@

# Cleanup
clean:
	@echo "$(RED)LIBFT : Cleaning object files...$(RESET_COLOR)"
	@rm -f $(OBJS) $(DEBUG_OBJS)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@echo "$(RED)LIBFT : Removing library...$(RESET_COLOR)"
	@rm -f $(NAME) debug.a

re: fclean all

# Phony Targets
.PHONY: all clean fclean re norm debug bonus
