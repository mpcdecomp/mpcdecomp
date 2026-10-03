#include "mpc2k.h"

void __far __fastcall __loadds zone_edit_paint(void)
{
	disp_list_run(((char *)DL_ZONE_EDIT));
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x5b, 0x11, 0x19 * ZONE_EDIT_ACTION + ((char *)TBL_ZONE_ACTION_LABELS));
	switch (ZONE_EDIT_ACTION) { case 0: goto br_09FC0; case 1: goto br_09FF0; case 2: case 3: case 4: goto br_0A00C; default: goto br_0A026; }
	goto br_0A026;
br_09FC0:
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x43, 0x1e, ((char *)STR_NEW_NAME));
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x79, 0x1e, TBL_SOUND_NAMES);
	if (!G_PLAY_MODE) goto br_0A026;
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x43, 0x27, PTR_STR_PRESS_ENTER);
	goto br_0A026;
br_09FF0:
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x37, 0x23, ((char *)STR_INSERT_SND));
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x79, 0x23, FP_SND_SECONDARY);
	goto br_0A026;
br_0A00C:
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x49, 0x1c, ((char *)STR_PRESSING_DO_IT));
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x49, 0x25, ((char *)STR_SELECTED_EDIT));
br_0A026:
	field_redraw();
}
