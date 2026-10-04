#include "mpc2k.h"

void __far __fastcall __loadds X_035EC(void)
{
	G_FLAG_8CA8 = 1;
	BUF_NAME_EDIT[G_SEQ_MODE] = (char)(NAME_EDIT_CASE ? 95 : 32);
	far_0369C();
}
