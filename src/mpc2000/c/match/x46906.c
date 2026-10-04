#include "mpc2kxl.h"

extern char C0_B_0D7F9;
extern char C0_W_0D7E8[1];
extern char C1_W_00EAA[1];
extern char C1_W_00ED8[1];
extern char __far msg_file_exists[];

void __far __fastcall __loadds file_exists_paint(void)
{
	((void (__far *)(char __far *))far_3ED98)(msg_file_exists);
	((void (__far *)(char __far *))disp_list_run)(C1_W_00EAA);
	if (((int (__far *)(void))far_37E82)() != 2) goto br_46947;
	if (C0_B_0D7F9 != 0x53) goto br_46947;
	if (((int (__far *)(char __far *))L_3E92C)(C0_W_0D7E8)) goto br_46953;
br_46947:
	((void (__far *)(char __far *))disp_list_run)(C1_W_00ED8);
br_46953:
	;
}
