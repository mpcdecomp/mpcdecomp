#include "mpc2k.h"

void __far sample_dma_setup_large(void)
{
	int si_;

	si_ = 0;
L_01FEF:
	pad_note_release(si_);
	si_++;
	if (si_ < 0x80) goto L_01FEF;
}
