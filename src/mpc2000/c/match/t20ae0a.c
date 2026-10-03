#include "mpc2k.h"

void __far __fastcall __loadds file_exists_paint(void)
{
	disp_list_run(DL_RENAME_FILE);
	((void (__far __pascal *)(int, int, int, int))cmd_dispatch_1E)(0x71, 0x13, FP_LOADED_SND_SEG, FP_LOADED_SND);
	((void (__far __pascal *)(int, int, int, int))cmd_dispatch_1E)(0x2f, 0x1c, PTR_STR_PRESS_ENTER_SEG, (*(int *)&PTR_STR_PRESS_ENTER));
	field_redraw();
}
