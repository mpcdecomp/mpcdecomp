#include "mpc2kxl.h"

long __far far_43FA8(char p0, long p1, long p3)
{
	char far *v0;
	char far *v1;

	((void (__far *)(long, int))disk_progress_msg)(p1, 1);
	v0 = ((long (__far *)(long, int))fs_open)(p1, 1);
	if (v0) goto br_43FFC;
	v1 = ((long (__far *)(char, long, long))far_4400A)(p0, p1, p3);
	v0 = v1;
	if (v0) goto br_43FFC;
	disk_file_close();
br_43FFC:
	field_handler_nop();
	return v0;
}
