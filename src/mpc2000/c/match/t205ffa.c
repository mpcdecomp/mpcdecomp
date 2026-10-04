#include "mpc2k.h"
void __far __pascal voice_trigger_full(long, char, char, char, char, long);

void __far __pascal seq_write_data(long p7, int p6, char p5, char p4, long p2, long p0)
{
	voice_trigger_full(p7, 0x17, p5, p4, 0x14, p2);
	install_handler_15((void (__far *)(void))p0);
	if (!p6) goto br_06412;
	win_keys_merge(TBL_WINKEYS_026FE);
br_06412:
	;
}
