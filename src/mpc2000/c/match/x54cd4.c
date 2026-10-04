#include "mpc2kxl.h"

void __far far_54CD4(void)
{
	int si_;

	if (C2_B_060B8) goto br_54CFC;
	C2_B_060B8 = 1;
	si_ = 2;
loop_54CE4:
	C2_W_05972[si_] = far_54CC0(C2_W_05972[si_]);
	si_++;
	if (si_ < 0x746) goto loop_54CE4;
br_54CFC:
	draw_bitmap_ptr(0, 0, C2_W_05972);
}
