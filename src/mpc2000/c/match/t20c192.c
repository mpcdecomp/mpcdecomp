#include "mpc2k.h"

int __far __pascal ctrl_port_caller(long p2, long p0)
{
	char l4[4];

	l4[0] = 7;
	l4[1] = 4;
	*(int *)(l4 + 2) = ctrl_io_access(p2);
	switch (((int (__far __pascal *)(long, int))mem_block_process)(p0, 0)) { case 0: goto br_0C631; }
	switch (((int (__far __pascal *)(char __far *, int))bcd_display_calc)(l4, 2)) { case 0: goto br_0C62C; }
	switch (ctrl_port_48_B8(*(int *)(l4 + 2))) { case 0: goto br_0C62C; }
	switch (pgm_file_write(p2)) { case 0: goto br_0C62C; }
	int2F_dispatch_10();
	return 1;
br_0C62C:
	int2F_dispatch_10();
br_0C631:
	return 0;
}
