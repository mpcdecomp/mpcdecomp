#include "mpc2kxl.h"

extern char C1_B_0D7BA;

void __far pending_ops_set(char p0)
{
	C1_B_0D7BA = p0;
}
