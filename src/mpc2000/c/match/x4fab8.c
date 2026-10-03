#include "mpc2kxl.h"

extern char C0_B_098B8;
extern char C2_B_098B9;
extern char C2_W_098BA;

void __far __fastcall __loadds copy_note_f5(void)
{
	switch (((int (__far *)(int, int, int, int))copy_note_params_body)(C2_B_098B9, C2_W_098BA, C0_B_098B8, (*(unsigned char *)&C2_B_PAD_NOTE))) { case 0: goto br_4FAEA; }
	(*(unsigned char *)&C2_B_PAD_NOTE) = C2_W_098BA;
	((void (__far __fastcall __loadds *)(void))copy_note_close)();
br_4FAEA:
	;
}
