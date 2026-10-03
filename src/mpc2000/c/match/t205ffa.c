#include "mpc2k.h"

void __far __pascal seq_write_data(long p7, int p6, char p5, char p4, long p2, long p0)
{
	((void (__far __pascal *)(long, int, char, char, int, long))voice_trigger_full)(p7, 0x17, p5, p4, 0x14, p2);
	((void (__far __pascal *)(long))install_handler_15)(p0);
	if (!p6) goto br_06412;
	win_keys_merge(TBL_WINKEYS_026FE);
br_06412:
	;
}
