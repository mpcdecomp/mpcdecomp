#include "mpc2k.h"


int __far __pascal sample_load_wrapper(long p0)
{
	if (!sample_data_load_2(p0)) {
		return 1;
	}
	G_ERRNO = ERR_NAME_IN_USE;
	err_msg_report();
	return 0;
}
