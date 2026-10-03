#include "mpc2k.h"

void __near fn_06680(void)
{
	switch (G_COPY_NOTE_CURSOR) { case 0: goto br_06698; case 1: goto br_066B0; case 2: goto br_066BA; case 3: goto br_066C6; }
	G_COPY_NOTE_CURSOR = 3;
	goto br_066C6;
br_06698:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int))seq_write_data)(((char *)&G_COPY_SRC_PGM), 1, 0x55, 0xb, 0, 0, 0, 0);
	return;
br_066B0:
	timer_value_read_1(G_COPY_SRC_NOTE, 0x55, 0x14, 0);
	return;
br_066BA:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int))seq_write_data)(((char *)&G_COPY_DST_PGM), 1, 0x55, 0x20, 0, 0, 0, 0);
	return;
br_066C6:
	timer_value_read_1(G_COPY_DST_NOTE, 0x55, 0x29, 0);
}
