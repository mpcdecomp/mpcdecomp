#include "mpc2k.h"

void __far far_000DE(void)
{
	int v;

	v = port_c0_read() & ~0x18 | 0x20;
	port_c0_write(v);
	port_c0_write(v & ~0x20);
	delay_ticks(0x5d);
}
