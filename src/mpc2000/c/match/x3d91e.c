#include "mpc2kxl.h"

extern char C0_TBL_065C2[1];
extern char C0_W_06484[1];

void __near fn_3D91E(void)
{
	((void (__far *)(char __far *))handler_set_install)(C0_W_06484);
	switch (((int (__far *)(char __far *))sound_list_contains)((*(char __far **)&C0_FP_0D7C2))) { case 0: goto br_3D950; }
	*(int far *)(C2_FP_MIDI_IN_BLOCK + 2) = (unsigned char)(*(char __far **)&C0_FP_0D7C2)[8];
br_3D950:
	if (C2_W_SAMPLE_DUMP_CURSOR < 0) goto br_3D95E;
	if ((unsigned)C2_W_SAMPLE_DUMP_CURSOR < 6) goto br_3D964;
br_3D95E:
	C2_W_SAMPLE_DUMP_CURSOR = 0;
br_3D964:
	((int (__far *)(void))*(long *)(C0_TBL_065C2 + C2_W_SAMPLE_DUMP_CURSOR * 42))();
}
