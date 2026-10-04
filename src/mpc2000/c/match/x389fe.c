#include "mpc2kxl.h"

extern char C0_TBL_09163[1];

int __near fn_389FE(char p0)
{
	C0_TBL_09163[p0 * 388] = 0x7f;
	return p0;
}
