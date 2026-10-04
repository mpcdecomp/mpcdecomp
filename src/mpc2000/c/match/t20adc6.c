#include "mpc2k.h"

int __far __pascal sample_access_caller(char __far *name, int flag)
{
	G_ERRNO = ERR_UNKNOWN;
	if (flag && sample_ptr_access(name)) G_ERRNO = ERR_NAME_IN_USE;
	else if (!((int (__far *)(void))sample_caller_setup)()) G_ERRNO = ERR_SOUND_DIR_FULL;
	else return 1;
	return 0;
}
