/*
** my_putchar.c
** File description:
** Display characters
*/

#include "function.h"

void my_putchar(char c)
{
	write(1, &c, 1);
}
