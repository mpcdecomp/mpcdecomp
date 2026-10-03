#include "mpc2k.h"

int __far __pascal sample_access_caller(char __far *name, int flag)
{
	G_ERRNO = 0;
	if (flag && sample_ptr_access(name)) G_ERRNO = 8;
	else if (!((int (__far *)(void))sample_caller_setup)()) G_ERRNO = 9;
	else return 1;
	return 0;
}
