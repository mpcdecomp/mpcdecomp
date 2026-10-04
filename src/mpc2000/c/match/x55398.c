#include "mpc2kxl.h"

extern char __far L_4BD9A[];
extern char __far far_5444A[];

void __far __fastcall __loadds snd_debug_re_id(void)
{
	((void (__far *)(char __far *, char __far *))disp_message_window)(far_5444A, L_4BD9A);
	((void (__far *)(void))sound_list_renumber)();
	field_handler_nop();
}
