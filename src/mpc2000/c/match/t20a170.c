#include "mpc2k.h"

int __far __pascal range_process(char far *p, int rows, int width, int nrows, int ncols)
{
	char far *q;
	int i;
	int n;
	int w;
	int skip_rows;
	int skip;

	q = p;
	n = nrows > rows ? rows : nrows;
	skip_rows = rows - n;
	w = ncols > width ? width : ncols;
	skip = width - w;
	for (i = 0; i < n; i++) {
		if (int2F_call_fn6(q, w) != w)
			return 0;
		range_proc_setup(skip);
		q += ncols;
	}
	range_proc_setup(skip_rows * width);
	return 1;
}
