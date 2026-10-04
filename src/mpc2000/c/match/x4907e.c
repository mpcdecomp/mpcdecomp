#include "mpc2kxl.h"
#include <conio.h>

int __far far_4907E(void)
{
	outp(PORT_C002, 7);
	timer_loop_io();
	outp(PORT_C002, 5);
	return 5;
}
