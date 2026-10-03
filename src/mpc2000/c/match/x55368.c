#include "mpc2kxl.h"

extern char C1_SEG[1];
extern char EP_FAR_4A026_OFF[1];
extern char EP_FAR_55416_OFF[1];
extern char EP_FAR_55416_SEG[1];
extern char EP_L_3F9AC_OFF[1];
extern char EP_L_3F9AC_SEG[1];

void __far __fastcall __loadds snd_debug_id_sort(void)
{
	((void (__far *)(char __near *, char __near *, char __near *, char __near *))disp_message_window)(EP_FAR_4A026_OFF, C1_SEG, EP_FAR_55416_OFF, EP_FAR_55416_SEG);
	((long (__far *)(char __near *, char __near *))far_40138)(EP_L_3F9AC_OFF, EP_L_3F9AC_SEG);
	field_handler_nop();
}
