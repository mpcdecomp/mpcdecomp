#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C0_W_050DC[1];
extern int C0_W_09600;

void __far L_3D06E(void)
{
	*(int *)C0_B_098B8 = ((int (__near *)(int))lcd_init_setup)(*(int far *)(((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7) + 38));
	C0_W_09600 = 1;
	((void (__far *)(char __far *, char __far *))ui_field_engine)(C0_W_050DC, C0_B_098B8);
}
