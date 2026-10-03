#include "mpc2k.h"

void __near fn_03724(void)
{
	int i;

	switch (FXEDIT_CURSOR) {
	default:
		FXEDIT_CURSOR = 0;
		goto c0;
	case 1:
		X_04428();
		return;
	case 2:
		X_0455A();
		return;
	case 3:
		i = 7;
		goto common;
	case 4:
		i = 8;
	common:
		status_read_6A_3((long)(char __far *)&G_EDIT_FIELD_VAL, 0, 0, 1, TBL_1360[i * 2], TBL_1361[i * 2], 0L, 0L);
		win_keys_merge_disable();
		WIN_FIELD_BOX_W = 0x1f;
		EDIT_CURSOR_H = 0x26;
		return;
	case 0:
	c0:
		L_043EE();
	}
}
