#include "mpc2k.h"

void __far * __cdecl _fmemset(void __far *, int, unsigned);
#pragma intrinsic(_fmemset)

void __far __pascal sample_desc_init(struct SND __far *s)
{
	_fmemset(s, 0, sizeof *s);
	s->level = 100;
	s->pool_idx = 0x7fff;
	s->field_25 = 1;
	s->rate = 44100;
}
