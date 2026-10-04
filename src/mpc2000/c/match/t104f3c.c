#include "mpc2k.h"

void __near fx_copy_arm_field(void)
{
	switch (COPY_FX_CURSOR) { case 0: goto br_04ED0; case 1: goto br_04EEA; case 2: goto br_04EF6; case 3: goto br_04F02; }
	return;
br_04ED0:
	seq_write_data(((char *)&G_COPY_SRC_PGM), 1, 0x55, 0xb, 0, 0, (void (far *)(void))copy_fx_close);
	return;
br_04EEA:
	voice_trigger_full(G_COPY_SRC_NOTE, 3, 0x55, 0x14, 0xa, 0, 0);
	return;
br_04EF6:
	seq_write_data(((char *)&G_COPY_DST_PGM), 1, 0x55, 0x20, 0, 0, (void (far *)(void))copy_fx_close);
	return;
br_04F02:
	voice_trigger_full(G_COPY_DST_NOTE, 3, 0x55, 0x29, 0xa, 0, 0);
}
