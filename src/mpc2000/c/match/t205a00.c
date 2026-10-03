#include "mpc2k.h"

void __far __pascal _memcpy_3(struct FXS __far *p)
{
	struct FXS __far *q;

	q = p++;
	*q = *(struct FXS *)FXS_DEFAULT;
	*p = *(struct FXS *)FXS_DEFAULT;
}
