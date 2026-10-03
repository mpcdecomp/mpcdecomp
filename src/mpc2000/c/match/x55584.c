#include "mpc2kxl.h"

void __far L_55584(void)
{
	lcd_write_data(C0_B_09603 ? 8 : 1, C0_B_09603 << 0xd, 0x2000);
}
