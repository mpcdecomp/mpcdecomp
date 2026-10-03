#include "mpc2k.h"

void __far L_07398(void)
{
	int v0;

	v0 = fn_0683A();
	if (SAMPLE_TIME <= (unsigned)v0) goto L_073A4;
	SAMPLE_TIME = v0;
L_073A4:
	fn_06786();
}
