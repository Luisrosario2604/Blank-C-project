/*
** manager file
** File description:
** main.c
*/

#include "function.h"

void help() {
	my_putstr("Help -h");
}

int main(int ac, char *av[])
{
	if (ac == 2 && av[1][0] == '-' && av[1][1] == 'h') {
		help();
	} else if (ac == 1) {
		container_t *container = malloc(sizeof(container_t));
		container->structure = malloc(sizeof(structure_t));
		free(container->structure);
		free(container);
		return (0);
	} else {
		return (84);
	}
}
