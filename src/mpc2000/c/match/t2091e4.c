#include "mpc2k.h"

void __far sample_str_scan_4(void)
{
	long v;

	v = SND_CURRENT->loop + G_EDIT_FIELD_VAL;
	if (v < SND_CURRENT->start) SND_CURRENT->start = v;
	SND_CURRENT->end = v;
}
