#include "mpc2k.h"

void __far X_03432(void)
{
	WIN_FIELD_BOX_R = EDIT_CURSOR_X = G_SEQ_MODE * 6 + WIN_FIELD_X;
	if (G_FLAG_8CA8) {
		cmd_dispatch_1E(WIN_FIELD_X, EDIT_FIELD_Y, BUF_NAME_EDIT);
		((void (__far __pascal *)(int, char, char, char))cmd_param_setup)((unsigned char)WIN_FIELD_BOX_R, WIN_FIELD_BOX_B, 6, 0);
	} else
		((void (__far __pascal *)(int, char, char, char))cmd_param_setup)(EDIT_CURSOR_X, EDIT_CURSOR_Y, WIN_FIELD_BOX_W, EDIT_CURSOR_H);
}
