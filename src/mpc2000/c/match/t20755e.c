#include "mpc2k.h"

int __far sample_caller_setup(void)
{
	int n;
	struct SND __far *p;

	n = 0;
	for (p = *(struct SND __far **)PTR_SAMPLE_BUF; p; p = p->next) n++;
	return n;
}
