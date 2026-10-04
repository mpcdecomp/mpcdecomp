#include "mpc2k.h"

void __far sample_str_scan_6(void)
{
	struct SND __far *p;
	SND_CURRENT->loop = G_EDIT_FIELD_VAL;
	p = SND_CURRENT;
	*(long __far *)&p->field_32 = addr_calc_segment(G_EDIT_FIELD_VAL, 0);
}
