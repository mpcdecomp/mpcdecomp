#include "mpc2k.h"

void __far fx_redraw(void)
{
	lcd_clear_region_impl(G_STATE_9D8B, B_4FE1);
}
