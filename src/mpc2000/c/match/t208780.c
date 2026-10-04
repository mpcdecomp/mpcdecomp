#include "mpc2k.h"

void __far L_08B5E(void)
{
	if (*(long far *)(((char __far *)SND_CURRENT) + 24) >= G_EDIT_FIELD_VAL) goto L_08B7F;
	*(long far *)(((char __far *)SND_CURRENT) + 24) = G_EDIT_FIELD_VAL;
L_08B7F:
	*(long far *)(((char __far *)SND_CURRENT) + 20) = G_EDIT_FIELD_VAL;
}
