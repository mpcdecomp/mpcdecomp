#include "mpc2kxl.h"

int __far name_field_enter(char far *p0)
{
	if (!((int (__far *)(long, char __far *))far_3FE9E)(0L, p0)) {
		name_split_number_suffix(p0);
		return 1;
	}
	return 0;
}
