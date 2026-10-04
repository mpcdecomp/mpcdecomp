#include "mpc2kxl.h"

void __far __fastcall __loadds sample_dump_request(void)
{
	if (C0_W_08DC4) goto br_3D784;
	string_scan_sysex((*(char *)P_SDS_EXCL_CH), *(int far *)(C2_FP_MIDI_IN_BLOCK + 2));
br_3D784:
	;
}
