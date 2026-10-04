#include "mpc2kxl.h"

long __far draw_invert_box(int arg_0, int arg_2, int arg_4, int arg_6)
{
	long t1;
	long t2;

	t1 = disp_select_plane(3);
	t2 = disp_list_op_xy2b(18, arg_0 - 1, arg_2 - 1, arg_4 + 1, arg_6 + 1);
	return disp_select_plane(1);
}
