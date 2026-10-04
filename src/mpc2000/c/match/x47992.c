#include "mpc2kxl.h"

extern char C0_B_098B8;
extern char far *C2_FP_0117A;
extern char C2_W_01130[1];

void __far tgt_47992(void)
{
	handler_set_install(C2_W_01130);
	C0_B_098B8 = 0;
	((int (__far *)(void))C2_FP_0117A)();
}
