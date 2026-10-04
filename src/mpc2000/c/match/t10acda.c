#include "mpc2k.h"

void __far __fastcall __loadds X_0AF4C(void)
{
	if (SDS_STATE & 2) {
		SDS_STATE &= 0xfd;
		int4A_proc_caller(0x7d);
		midi_txrx_arm_field();
	} else if (SDS_STATE & 4) {
		SDS_STATE &= 0xfb;
		smem_free(SDS_RX_SND_SLOT);
		int4A_proc_caller(0x7d);
		midi_txrx_arm_field();
	} else
		SDS_STATE |= 1;
}
