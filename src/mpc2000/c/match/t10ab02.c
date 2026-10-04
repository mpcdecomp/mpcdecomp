#include "mpc2k.h"

void __far __fastcall __loadds far_0AD74(void)
{
	if (SDS_STATE & 2) {
		SDS_STATE &= 0xfd;
	} else {
		if (!(SDS_STATE & 4)) goto br_0AD99;
		SDS_STATE &= 0xfb;
	}
	int4A_proc_caller(0x7d);
br_0AD99:
	fn_0AA44();
	int44_wrapper(1);
}
