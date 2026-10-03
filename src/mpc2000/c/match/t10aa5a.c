#include "mpc2k.h"

void __near __pascal int4A_proc_caller(char p0)
{
	char l6[6];

	l6[0] = 0xf0;
	l6[1] = 0x7e;
	l6[2] = (*(char *)&SDS_EXCL_CH);
	l6[3] = p0;
	l6[4] = SDS_RX_PACKET & 0x7f;
	l6[5] = 0xf7;
	int4A_sysex_wrapper(l6, 6);
}
