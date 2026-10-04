#include "mpc2k.h"

void __far __fastcall __loadds midi_msg_io(int a0)
{
	G_FLAG_8CA8 = 1;
	BUF_NAME_EDIT[G_SEQ_MODE] = *(char *)&a0 + 0x30;
	far_0369C();
}
