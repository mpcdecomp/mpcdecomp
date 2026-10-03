#include "mpc2k.h"

void __far __fastcall __loadds X_0D356(void)
{
	if (((char __far *)SND_CURRENT)[19]) {
		string_int_access();
		return;
	}
	string_far_access();
}
