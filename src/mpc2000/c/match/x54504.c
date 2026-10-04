#include "mpc2kxl.h"

void __far fx_reverb_field_notify(void)
{
	((void (__far *)(char, char))lcd_clear_rect)(C0_B_0D7C7, C2_B_09606);
}
