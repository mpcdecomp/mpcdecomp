#include "mpc2k.h"

void __far __pascal cmd_exec_caller(long hi, long lo)
{
	int e, d;

	if (!SND_CURRENT || !SND_CURRENT->length) return;
	e = hi * 0xf5 / SND_CURRENT->length;
	d = lo * 0xf5 / SND_CURRENT->length - e;
	if (!d) d = 1;
	cmd_exec_0E_wrapper(2);
	cmd_build_params(WOP_OP4_13, 1, 0x15, 0xf5, 0x1b);
	cmd_build_params(WOP_OP4_12, e + 1, 0x15, d, 0x1b);
	cmd_exec_0E_wrapper(0);
}
