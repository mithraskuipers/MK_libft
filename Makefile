NAME = libft.a

SRCS =	ft_atoi.c \
		ft_bzero.c \
		ft_calloc.c \
		ft_isalnum.c \
		ft_isalpha.c \
		ft_isascii.c \
		ft_isdigit.c \
		ft_isprint.c \
		ft_itoa.c \
		ft_memchr.c \
		ft_memcmp.c \
		ft_memcpy.c \
		ft_memmove.c \
		ft_memset.c \
		ft_putchar_fd.c \
		ft_putendl_fd.c \
		ft_putnbr_fd.c \
		ft_putstr_fd.c \
		ft_split.c \
		ft_strchr.c \
		ft_strdup.c \
		ft_striteri.c \
		ft_strjoin.c \
		ft_strlcat.c \
		ft_strlcpy.c \
		ft_strlen.c \
		ft_strmapi.c \
		ft_strncmp.c \
		ft_strnstr.c \
		ft_strrchr.c \
		ft_strtrim.c \
		ft_substr.c \
		ft_tolower.c \
		ft_toupper.c \
		ft_isupper.c \

OFILES = $(SRCS:.c=.o)

BONUS_SRC = $(SRCS) \
		ft_lstadd_back_bonus.c \
		ft_lstadd_front_bonus.c \
		ft_lstclear_bonus.c \
		ft_lstdelone_bonus.c \
		ft_lstiter_bonus.c \
		ft_lstlast_bonus.c \
		ft_lstmap_bonus.c \
		ft_lstnew_bonus.c \
		ft_lstsize_bonus.c

BONUS_OFILES = $(OFILES) $(BONUS_SRC:.c=.o)

PLUSPLUS_SRC =	ft_stoupper.c \
		ft_ndigits.c \
		ft_ndigits_base.c \
		ft_undigits_base.c \
		ft_itoa_base.c \
		ft_toabs.c \
		ft_utoa_base.c \
		ft_utoa.c \
		ft_countlines_fd.c \
		ft_strlen_fd.c \
		ft_strlen_char.c

PLUSPLUS_OFILES = $(OFILES) $(BONUS_SRC:.c=.o) $(PLUSPLUS_SRC:.c=.o)

INCLUDES = libft.h

all: $(NAME)

$(NAME): $(OFILES) $(INCLUDES)
	@ar rcs $(NAME) $?
	@echo "\033[92mCompiled libft library\033[0m"

bonus: $(NAME) $(BONUS_OFILES) $(BONUS_SRC)
	@touch bonus
	@ar rcs $(NAME) $?
	@/bin/rm -f bonus
	@echo "\033[92mCompiled libft library + bonus\033[0m"


plusplus: $(NAME) $(BONUS_OFILES) $(BONUS_SRC) $(PLUSPLUS_OFILES) $(PLUSPLUS_SRC)
	@touch bonus
	@touch plusplus
	@ar rcs $(NAME) $?
	@/bin/rm -f bonus
	@/bin/rm -f plusplus
	@echo "\033[92mCompiled libft library + bonus + plusplus\033[0m"

%.o: %.c
	$(CC) -Wall -Wextra -Werror -c $<

clean:
	@/bin/rm -f $(PLUSPLUS_OFILES)
	@/bin/rm -f a.out
	@/bin/rm -f bonus

fclean:	clean
	@/bin/rm -f $(NAME)

re: fclean all