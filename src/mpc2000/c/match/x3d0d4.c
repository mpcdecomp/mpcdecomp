#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C0_W_05106[1];
extern int C0_W_09600;

void __far L_3D0D4(void)
{
	*(int *)C0_B_098B8 = ((int (__near *)(int))lcd_init_setup)(*(int far *)(((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7) + 40));
	C0_W_09600 = 2;
	((void (__far *)(char __far *, char __far *))ui_field_engine)(C0_W_05106, C0_B_098B8);
}
