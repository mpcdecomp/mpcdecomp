#include "mpc2k.h"

void __far L_08E48(void)
{
	if (*(long far *)(((char __far *)SND_CURRENT) + 20) <= G_EDIT_FIELD_VAL) goto L_08E69;
	*(long far *)(((char __far *)SND_CURRENT) + 20) = G_EDIT_FIELD_VAL;
L_08E69:
	*(long far *)(((char __far *)SND_CURRENT) + 24) = G_EDIT_FIELD_VAL;
}
