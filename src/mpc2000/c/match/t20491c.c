#include "mpc2k.h"

typedef struct { int quot, rem; } div_t;
div_t __far div(int, int);

void __far __pascal cmd_dispatch_caller2(int x, int y, char v)
{
	char b[4];
	div_t d;

	*(long *)b = *(long *)&W_1582;
	d = div(v, 20);
	switch (d.quot) {
	case 0:
		*(int *)(b + 1) = ((int *)TBL_155A)[d.rem];
		break;
	case 2:
		b[0] = TBL_155A[d.rem * 2];
		b[2] = TBL_155B[d.rem * 2];
		break;
	case 3:
		b[2] = 'k';
	case 1:
		*(int *)b = ((int *)TBL_155A)[d.rem];
	}
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(x, y, b);
}
