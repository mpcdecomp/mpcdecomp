#include "mpc2k.h"

typedef void (__far *FN)(void);

void __far __pascal ui_edit_zone_end(long a, FN fn)
{
	long len;

	if (ZONE_LEN_FIX) len = G_ZONE_END - G_ZONE_START;
	else len = 0;
	((void (__far __pascal *)(long __far *, long, long, long, FN, FN))ui_field_edit)(&G_ZONE_END, a, len, SND_CURRENT->length, (FN)L_09CE8, fn);
}
