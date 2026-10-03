#include "mpc2k.h"

int __far __pascal int38_call_pair(int p1, int p0)
{
	return int38_wrapper_2(2, p0, p1);
}
