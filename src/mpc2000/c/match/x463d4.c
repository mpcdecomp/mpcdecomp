#include "mpc2kxl.h"

extern char C1_W_00DA2[1];
extern char EP_MSG_FILE_EXISTS_OFF[1];
extern char EP_MSG_FILE_EXISTS_SEG[1];

void __far __fastcall __loadds load_sound_exists_paint(void)
{
	((void (__far *)(char __near *, char __near *))far_3ED98)(EP_MSG_FILE_EXISTS_OFF, EP_MSG_FILE_EXISTS_SEG);
	((void (__far *)(char __far *))disp_list_run)(C1_W_00DA2);
}
