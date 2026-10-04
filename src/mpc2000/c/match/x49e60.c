#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C2_W_01712[1];

void __far L_49E60(void)
{
	voice_release_all();
	C2_W_KEEP_OR_RETRY_CURSOR = 0;
	ui_field_engine(C2_W_01712, C0_W_0D7C2 + 0x12);
}
