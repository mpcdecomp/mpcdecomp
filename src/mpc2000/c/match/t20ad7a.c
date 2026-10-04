#include "mpc2k.h"

struct S40 { char b[40]; };

void __far __pascal _memcpy_5(struct SND __far *dst, struct SND __far *src)
{
	sample_desc_init(dst);
	*(struct S40 __far *)dst = *(struct S40 __far *)src;
	*(long __far *)&dst->field_32 = addr_calc_segment(src->loop, 0);
}
