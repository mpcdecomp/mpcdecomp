/* MPC2000 SYS text2: voice allocation (../2k/common/sys/text2.asm). */

#include "mpc2k.h"
#include <conio.h>

struct voice {
	char state;
	char rest[17];
};

void voice_release_all(void)
{
	unsigned v;

	for (v = 0; v < 32; v++)
		voice_release_full(v);
}

/* voice_release, then register group 6 gets 0BB8h/7FF0h. */
void __pascal voice_release_full(unsigned v)
{
	voice_release(v);
	if (P_9A4E[v] == 0) {
		TBL_578E[v] = 0;
		outpw(0x80, v | 0x600);
		outpw(0x82, 0xbb8);
		outpw(0x84, 0x7ff0);
	}
}

void __pascal voice_release(int v)
{
	if (P_9A4E[v] == 0) {
		VOICE_HOLD[v] = VOICE_TIMER[v] = TBL_574E[v] = 0;
		TBL_578E[v] = 3;
		((struct voice *)VOICE_TABLE)[v].state = -1;
		outpw(0x80, v | 0x400);
		outpw(0x82, 0xf448);
		outpw(0x84, 0);
	}
}
