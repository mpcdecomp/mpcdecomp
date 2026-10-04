#include "mpc2k.h"

void __near fn_0AD3A(void)
{
	X_07C12();
	if (sample_ptr_helper((*(long *)PTR_LCD_STATE))) goto br_0AD5C;
	(*(long *)PTR_LCD_STATE) = far_078E4();
br_0AD5C:
	win_keys_merge(((char *)TBL_WINKEYS_0423A));
	midi_txrx_arm_field();
	int44_wrapper(0);
	fn_0AA0C();
}
