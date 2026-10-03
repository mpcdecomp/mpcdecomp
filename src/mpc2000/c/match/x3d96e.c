#include "mpc2kxl.h"

void __near fn_3D96E(void)
{
	if (*(int far *)((*(char __far **)&C0_FP_0D7C2) + 48) <= 0x1f) goto br_3D97C;
	goto L_3D423;
br_3D97C:
	*(long far *)(C2_FP_MIDI_IN_BLOCK + 6) = *(long far *)((*(char __far **)&C0_FP_0D7C2) + 10);
	if (!(*(char __far **)&C0_FP_0D7C2)[37]) goto br_3D9C6;
	if (!*C2_FP_MIDI_IN_BLOCK) goto br_3D9C6;
	*(long far *)(C2_FP_MIDI_IN_BLOCK + 6) += *(long far *)((*(char __far **)&C0_FP_0D7C2) + 14) / 2L;
br_3D9C6:
	*(int far *)(C2_FP_MIDI_IN_BLOCK + 10) = (int)((*(long far *)((*(char __far **)&C0_FP_0D7C2) + 46) + 0x27L) / 0x28L);
	((void (__near *)(char __far *))fn_3D510)((*(char __far **)&C0_FP_0D7C2));
	*(int far *)(C2_FP_MIDI_IN_BLOCK + 4) = 0;
	*(int far *)(C2_FP_MIDI_IN_BLOCK + 14) = far_3E8C8();
	*(int far *)(C2_FP_MIDI_IN_BLOCK + 16) = 0x7d0;
	C0_W_08DC4 = 2;
	((void (__near *)(void))fn_3DA24)();
L_3D423:
	;
}
