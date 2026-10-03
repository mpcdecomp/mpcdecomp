#include "mpc2k.h"

void __far name_edit_change_default(void)
{
	X_03432();
	if (G_FLAG_8CA8) goto X_03ADB;
	((void (__far __pascal *)(int, char, char __far *))cmd_dispatch_1E)(WIN_FIELD_X, EDIT_FIELD_Y, BUF_NAME_EDIT);
X_03ADB:
	;
}
