##
## Makefile
## File description:
## Makefile for compilation
##

LIB_DIR	=	./lib/my/

LIB	=	libmy.a

UT_DIR	=	./tests/

UT_SRC	=

UT	=	units

BONUS_DIR	=	./bonus/

SRC_BONUS	=	$(BONUS_DIR).c\

BONUS_OBJ	=	$(SRC_BONUS:.c=.o)

SRC_DIR	=	./src/

SRC	=

MAIN	=	$(SRC_DIR)main.c

CFLAGS	=	-W -Wall -Wextra -pedantic -I./include/

LDFLAGS	=	-lcriterion -lgcov -coverage

OBJ	=	$(SRC:.c=.o) $(MAIN:.c=.o)

NAME	=	a.out

BONUS_NAME	=	a.out_bonus

all:	$(NAME)

$(NAME):	$(OBJ)
	make -C $(LIB_DIR)
	gcc -o $(NAME) $(OBJ) -L$(LIB_DIR) -lmy

gdb:
	make -C $(LIB_DIR)
	gcc -o $(NAME) $(SRC) $(MAIN) $(CFLAGS) -L$(LIB_DIR) -lmy -g3

tests_run:
	make -C $(LIB_DIR)
	gcc -o $(UT) $(UT_SRC) $(SRC) $(CFLAGS) $(LDFLAGS) -L$(LIB_DIR) -lmy
	./$(UT)

bonus:	$(BONUS_OBJ)
	make -C $(LIB_DIR)
	gcc -o $(BONUS_NAME) $(BONUS_OBJ) -L$(LIB_DIR) -lmy

clean:
	make clean -C $(LIB_DIR)
	rm -f ./include/*.gch
	rm -f $(OBJ) $(BONUS_OBJ) *.gc*
	rm -f $(LIB_DIR)*.o

fclean: 	clean
	make fclean -C $(LIB_DIR)
	rm -f $(NAME) $(BONUS_NAME) $(LIB_DIR)$(LIB) $(UT) a.out

re: 	fclean all
