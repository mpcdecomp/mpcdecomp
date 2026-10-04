#include "mpc2kxl.h"

void __far L_52E54(void)
{
	C2_B_09604 &= 0xfc;
	C2_B_09606 = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7)[69];
	((int (__far *)(void))*(long *)(((char *)&C2_TBL_FILTER4_FIELD_THUNK) + C2_W_FILTER4_CURSOR * 42))();
	((void (__far *)(void))disp_request_flush)();
}
