/* MPC2000 SYS text2: sound-edit screen glue -- field arming and key hooks. */

#include "mpc2k.h"

typedef void (far *fn)(void);

void X_090B2(void)
{
	((void (__far __pascal *)(void __far *, int, int, int, void (__far *)(void)))far_035F2)(&(*(char __far **)&SND_CURRENT), 0, 0x1a, 2, L_09092);
	((void (__far __pascal *)(void (__far *)(void)))install_handler_15)((fn)tgt_087D4);
}

void L_090D4(void)
{
	((void (__far __pascal *)(int, int, void (__far *)(void)))voice_trigger_caller)(0xc7, 1, win_key_nop_stub);
}

void L_090E6(void)
{
	voice_buffer_init((*(char __far **)&SND_CURRENT));
}

/* View: field arm, shared by TRIM/LOOP and znEDIT. */
void X_090F4(void)
{
	((void (__far __pascal *)(char __far *, int, int, int, int, void (__far *)(void)))voice_trigger_full)(&SND_EDIT_VIEW, 1, 0xd4, 0xc, 6, L_090E6);
	((void (__far __pascal *)(void (__far *)(void)))install_handler_15)(0);
}

void __fastcall __loadds L_09116(void)
{
	sample_name_search();
}
