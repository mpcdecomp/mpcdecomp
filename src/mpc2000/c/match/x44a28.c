#include "mpc2kxl.h"

extern char C1_W_00AF4[1];
extern char EP_L_44132_OFF[1];
extern char EP_L_44132_SEG[1];
extern char EP_MSG_SOFTKEY_WIPE_OFF[1];
extern char EP_MSG_SOFTKEY_WIPE_SEG[1];

void __far __fastcall __loadds disk_full_paint(void)
{
	((void (__far *)(char __near *, char __near *))draw_confirm_window)(EP_L_44132_OFF, EP_L_44132_SEG);
	if (((int (__far *)(void))far_37E82)()) goto br_44A57;
	((void (__far *)(int, int, char __near *, char __near *))draw_softkey_label)(3, 1, EP_MSG_SOFTKEY_WIPE_OFF, EP_MSG_SOFTKEY_WIPE_SEG);
br_44A57:
	((void (__far *)(char __far *))disp_list_run)(C1_W_00AF4);
}
