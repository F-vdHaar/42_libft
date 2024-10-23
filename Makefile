# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fvon-der <fvon-der@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/08 14:52:11 by fvon-der          #+#    #+#              #
#    Updated: 2024/10/23 13:08:22 by fvon-der         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Color Definitions
RESET_COLOR = \033[0;39m
YELLOW      = \033[0;93m
BLUE        = \033[0;94m
GREEN       = \033[0;92m
RED         = \033[1;31m

# Compiler and Flags
CC          = cc
NAME        = libft.a
CFLAGS      = -Wall -Wextra -Werror -I.
DEBUG_FLAGS = -g -O0 -Wall -Wextra -Werror -fsanitize=address -fsanitize=undefined \
			  -fno-strict-aliasing -fno-omit-frame-pointer -fstack-protector -DDEBUG -fno-inline
AR          = ar rcs

# Directories
OBJ_DIR     = obj
SRC_DIR     = .

SRCS = $(SRC_DIR)/ft_atoi.c $(SRC_DIR)/ft_bzero.c $(SRC_DIR)/ft_calloc.c $(SRC_DIR)/ft_isalnum.c \
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

# Manually define object files
OBJS = $(OBJ_DIR)/ft_atoi.o $(OBJ_DIR)/ft_bzero.o $(OBJ_DIR)/ft_calloc.o $(OBJ_DIR)/ft_isalnum.o \
	   $(OBJ_DIR)/ft_isalpha.o $(OBJ_DIR)/ft_isascii.o $(OBJ_DIR)/ft_isdigit.o $(OBJ_DIR)/ft_isprint.o \
	   $(OBJ_DIR)/ft_itoa.o $(OBJ_DIR)/ft_memchr.o $(OBJ_DIR)/ft_memcmp.o $(OBJ_DIR)/ft_memcpy.o \
	   $(OBJ_DIR)/ft_memmove.o $(OBJ_DIR)/ft_memset.o $(OBJ_DIR)/ft_putchar_fd.o $(OBJ_DIR)/ft_putendl_fd.o \
	   $(OBJ_DIR)/ft_putnbr_fd.o $(OBJ_DIR)/ft_putstr_fd.o $(OBJ_DIR)/ft_split.o $(OBJ_DIR)/ft_strchr.o \
	   $(OBJ_DIR)/ft_strdup.o $(OBJ_DIR)/ft_striteri.o $(OBJ_DIR)/ft_strjoin.o $(OBJ_DIR)/ft_strlcat.o \
	   $(OBJ_DIR)/ft_strlcpy.o $(OBJ_DIR)/ft_strlen.o $(OBJ_DIR)/ft_strmapi.o $(OBJ_DIR)/ft_strncmp.o \
	   $(OBJ_DIR)/ft_strnstr.o $(OBJ_DIR)/ft_strrchr.o $(OBJ_DIR)/ft_strtrim.o $(OBJ_DIR)/ft_substr.o \
	   $(OBJ_DIR)/ft_tolower.o $(OBJ_DIR)/ft_toupper.o $(OBJ_DIR)/ft_lstadd_back_bonus.o \
	   $(OBJ_DIR)/ft_lstadd_front_bonus.o $(OBJ_DIR)/ft_lstclear_bonus.o $(OBJ_DIR)/ft_lstdelone_bonus.o \
	   $(OBJ_DIR)/ft_lstiter_bonus.o $(OBJ_DIR)/ft_lstlast_bonus.o $(OBJ_DIR)/ft_lstmap_bonus.o \
	   $(OBJ_DIR)/ft_lstnew_bonus.o $(OBJ_DIR)/ft_lstsize_bonus.o

# Debug object files
DEBUG_OBJS = $(OBJ_DIR)/debug_ft_atoi.o $(OBJ_DIR)/debug_ft_bzero.o $(OBJ_DIR)/debug_ft_calloc.o \
			 $(OBJ_DIR)/debug_ft_isalnum.o $(OBJ_DIR)/debug_ft_isalpha.o $(OBJ_DIR)/debug_ft_isascii.o \
			 $(OBJ_DIR)/debug_ft_isdigit.o $(OBJ_DIR)/debug_ft_isprint.o $(OBJ_DIR)/debug_ft_itoa.o \
			 $(OBJ_DIR)/debug_ft_memchr.o $(OBJ_DIR)/debug_ft_memcmp.o $(OBJ_DIR)/debug_ft_memcpy.o \
			 $(OBJ_DIR)/debug_ft_memmove.o $(OBJ_DIR)/debug_ft_memset.o $(OBJ_DIR)/debug_ft_putchar_fd.o \
			 $(OBJ_DIR)/debug_ft_putendl_fd.o $(OBJ_DIR)/debug_ft_putnbr_fd.o $(OBJ_DIR)/debug_ft_putstr_fd.o \
			 $(OBJ_DIR)/debug_ft_split.o $(OBJ_DIR)/debug_ft_strchr.o $(OBJ_DIR)/debug_ft_strdup.o \
			 $(OBJ_DIR)/debug_ft_striteri.o $(OBJ_DIR)/debug_ft_strjoin.o $(OBJ_DIR)/debug_ft_strlcat.o \
			 $(OBJ_DIR)/debug_ft_strlcpy.o $(OBJ_DIR)/debug_ft_strlen.o $(OBJ_DIR)/debug_ft_strmapi.o \
			 $(OBJ_DIR)/debug_ft_strncmp.o $(OBJ_DIR)/debug_ft_strnstr.o $(OBJ_DIR)/debug_ft_strrchr.o \
			 $(OBJ_DIR)/debug_ft_strtrim.o $(OBJ_DIR)/debug_ft_substr.o $(OBJ_DIR)/debug_ft_tolower.o \
			 $(OBJ_DIR)/debug_ft_toupper.o $(OBJ_DIR)/debug_ft_lstadd_back_bonus.o $(OBJ_DIR)/debug_ft_lstadd_front_bonus.o \
			 $(OBJ_DIR)/debug_ft_lstclear_bonus.o $(OBJ_DIR)/debug_ft_lstdelone_bonus.o $(OBJ_DIR)/debug_ft_lstiter_bonus.o \
			 $(OBJ_DIR)/debug_ft_lstlast_bonus.o $(OBJ_DIR)/debug_ft_lstmap_bonus.o $(OBJ_DIR)/debug_ft_lstnew_bonus.o \
			 $(OBJ_DIR)/debug_ft_lstsize_bonus.o

# Targets
all: $(NAME)

bonus: all

# Create the library
$(NAME): $(OBJS)
	@echo "$(YELLOW)LIBFT : Creating library $(NAME)...$(RESET_COLOR)"
	@$(AR) $(NAME) $(OBJS)
	@echo "$(GREEN)LIBFT : Library $(NAME) created successfully!$(RESET_COLOR)"

# Debug build
debug: $(DEBUG_OBJS)
	@echo "$(YELLOW)LIBFT : Creating debug library debug.a...$(RESET_COLOR)"
	@$(AR) rcs debug.a $(DEBUG_OBJS)
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
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "$(YELLOW)LIBFT : Compiling $< into $@...$(RESET_COLOR)"

# Compile debug source files
$(OBJ_DIR)/debug_%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@$(CC) $(DEBUG_FLAGS) -c $< -o $@
	@echo "$(YELLOW)LIBFT : Compiling $< into debug $@...$(RESET_COLOR)"

# ================================
# Cleanup
# ================================
clean:
	@echo "$(RED)LIBFT : Cleaning object files...$(RESET_COLOR)"
	@rm -f $(OBJS) $(DEBUG_OBJS)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@echo "$(RED)LIBFT : Removing library...$(RESET_COLOR)"
	@rm -f $(NAME) debug.a

re: fclean all

# ================================
# Phony Targets
.PHONY: all clean fclean re norm debug
