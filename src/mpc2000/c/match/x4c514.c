#include "mpc2kxl.h"

extern char C0_W_0D7C2[1];
extern char C2_W_02294[1];

void __far far_4C514(void)
{
	C2_W_COPY_SOUND_CURSOR = 0;
	ui_field_engine(C2_W_02294, C0_W_0D7C2);
}
