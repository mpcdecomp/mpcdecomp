#include "mpc2k.h"

void __near __pascal mpc_ctrl_init(char __far *d, struct SND __far *s)
{
	*(long __far *)(d + 0x1a) = SMEM_POOL[s->pool_idx].base + s->end;
	*(long __far *)(d + 0x1e) = *(long __far *)(d + 0x1a) - s->loop;
	*(long __far *)(d + 0x22) = *(long __far *)&s->field_32;
	if (!s->loop) {
		d[4] = 0;
		return;
	}
	d[4] = s->loopon;
}
