#include "mpc2k.h"

void __far X_049DA(void)
{
	WIN.box_w = (WIN.digits - WIN.seq_mode + 1) * 6;
	((void (__far __pascal *)(int, char, char, char))cmd_param_setup)(WIN.cur_x, WIN.cur_y, WIN.box_w, WIN.cur_h);
}
