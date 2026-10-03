#include "mpc2k.h"

void __near __pascal int2F_fn5_caller(long n)
{
	while (n--)
		if (int2F_call_fn5() < 0) _longjmp(P_8F62, 4);
}
