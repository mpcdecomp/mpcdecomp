#include "mpc2kxl.h"
#include <conio.h>

int __far far_49070(void)
{
	return inp(PORT_C002) & 0x80 ? 0 : 1;
}
