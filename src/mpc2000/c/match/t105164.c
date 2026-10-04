#include "mpc2k.h"

void __near X_050E4(void)
{
	char __far *p;

	p = (char __far *)track_calc_offset(G_PAD_NOTE_BASE);
	((void (__far __pascal *)(char __far *, char, char, char, unsigned char, char, long, long))status_read_6A_3)(p + 8, p[6] + 1, 0x7f, 3, 0x92, 0x27, 0L, 0L);
}
