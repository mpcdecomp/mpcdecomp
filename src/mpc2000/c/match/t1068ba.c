#include "mpc2k.h"

int __near fn_0683A(void)
{
	long t;
	int si;

	t = X_00E76();
	if (t >= 0) {
		si = samples_to_tenths(t);
		if (G_REC_MODE == REC_MODE_STEREO) si = si / 2;
		si--;
		if (si < 0) si = 0;
		return si;
	}
	return 0;
}
