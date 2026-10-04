#include "mpc2k.h"

struct s64 { char b[64]; };

/* a new program in slot n: its name, the header defaults, every pad as the first, the mixes and FX */
void __far __pascal far_memop_handler_1(int n)
{
	struct PGM __far *p;
	char i;

	p = ((struct PGM __far * __near *)PGM_TABLE)[n];
	_memcpy_2(p->name, n);
	p->hdr_note = 0;
	p->hdr_14[0] = 0x88;
	p->hdr_14[1] = 0x78;
	p->hdr_14[2] = 0xc;
	p->hdr_14[3] = 0x2d;
	p->hdr_14[4] = 0;
	p->hdr_14[5] = 0x14;
	p->hdr_14[6] = 0xce;
	p->hdr_14[7] = 0x32;
	p->midi_pgm = n;
	p->hdr_1d = PGM_NOTE_BASE;
	*(struct s64 __far *)p->padmap = *(struct s64 *)P_8F78;
	((void (__far __pascal *)(struct PGM_PAD __far *))_memset_2)(p->pad);
	for (i = 1; i < 64; i++)
		p->pad[i] = p->pad[0];
	((void (__far __pascal *)(struct PGM_MIX __far *))far_memop_str_1)(p->mix);
	_memcpy_3(p->fxs);
	((void (__far __pascal *)(struct FXR __far *))far_memop_str_2)(p->fxr);
}
