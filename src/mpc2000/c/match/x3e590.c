#include <conio.h>

void __far far_3E590(void)
{
	outpw(0x88, inpw(0x88) & 0xff7f | 0x100);
}
