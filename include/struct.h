/*
** struct.h
** File description:
** All structures
*/

#ifndef STRUCT_H
#define STRUCT_H

typedef struct structure_s {
	int a;
} structure_t;

typedef struct container_s {
	structure_t *structure;
} container_t;

#endif
