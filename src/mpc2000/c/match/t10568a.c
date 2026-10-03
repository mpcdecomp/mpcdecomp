#include "mpc2k.h"

void __far __fastcall __loadds L_0560A(int a0)
{
	if (!(char)a0) goto br_0563C;
	if (pad_bank_get() != (unsigned char)((unsigned char)G_PAD_INDEX >> 4)) goto br_0563C;
	G_PAD_INDEX = (pad_bank_get() << 4) + (char)(a0 >> 8);
	L_054DC();
br_0563C:
	;
}
