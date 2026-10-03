#include "mpc2k.h"

void __near __pascal status_smem_read(long n)
{
	while (n--)
		if (int2F_call_fn5() < 0) _longjmp(P_9D42, 4);
}
