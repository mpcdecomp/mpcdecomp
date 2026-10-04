#include "mpc2k.h"

void __far __pascal rep_memcpy_handler(struct SND __far *old, struct SND __far *new)
{
	int p;
	int i;

	for (p = 0; p < 24; p++)
		if ((unsigned)((struct PGM __far * __near *)PGM_TABLE)[p]->blk_para > 2)
			for (i = 0; i < 64; i++)
				if (((struct PGM __far * __near *)PGM_TABLE)[p]->pad[i].snd == old)
					((struct PGM __far * __near *)PGM_TABLE)[p]->pad[i].snd = new;
}
