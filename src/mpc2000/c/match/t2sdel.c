/* MPC2000 SYS text2: the DELETE SOUND, DELETE ALL SOUNDS and COPY SOUND windows. */

#include "mpc2k.h"

void __fastcall __loadds delete_sound_paint(void)
{
	disp_list_run(DL_DELETE_SOUND);
	cmd_dispatch_1E(0x49, 0x11, sample_check_active((*(char __far **)&SND_CURRENT)) ? STR_ROM_1 : STR_SND_1);
	cmd_dispatch_1E(0x61, 0x11, (*(char __far **)&SND_CURRENT));
}

void __fastcall __loadds L_0855C(void)
{
	if (((int (__far __pascal *)(char __far *))sample_load_wrapper)((*(char __far **)&SND_CURRENT)))
		win_keys_merge(TBL_WINKEYS_DELETE_SOUND);
}

void __fastcall __loadds delete_all_sounds_do_it(void)
{
	((void (__far __pascal *)(char __far *))voice_release_all_if)((*(char __far **)&SND_CURRENT));
	disp_list_run(PTR_DL_PROCESSING);
	sample_data_load_1();
	smem_transfer_io();
	voice_buffer_init((*(char __far **)&SND_CURRENT) = ((char __far * (__far *)(void))far_078E4)());
	disp_list_run(P_327B);
	snd_edit_page_return();
}

void __fastcall __loadds delete_all_sounds_paint(void)
{
	disp_list_run(DL_DELETE_ALL_SOUNDS);
}

void __fastcall __loadds delete_sound_all(void)
{
	if (((int (__far __pascal *)(char __far *))sample_load_wrapper)((*(char __far **)&SND_CURRENT)))
		win_keys_merge(TBL_WINKEYS_DELETE_ALL_SOUNDS);
}

/* COPY SOUND's DO IT: the copy becomes the current sound */
void __fastcall __loadds voice_init_caller(void)
{
	struct SND __far *p;

	disp_list_run(PTR_DL_PROCESSING);
	p = sample_ptr_accessor(TBL_SOUND_NAMES, SND_CURRENT);
	if (p == 0)
		err_msg_report();
	else
		voice_buffer_init((char __far *)(SND_CURRENT = p));
	disp_list_run(P_32FE);
	snd_edit_page_return();
}

void __fastcall __loadds L_0865E(void)
{
	cmd_dispatch_1E(0x73, 0x10, (*(char __far **)&SND_CURRENT));
	cmd_dispatch_1E(0x73, 0x28, TBL_SOUND_NAMES);
	field_redraw();
}

void __fastcall __loadds L_0868A(void)
{
	if (((int (__far __pascal *)(char __far *))sample_load_wrapper)((*(char __far **)&SND_CURRENT))) {
		win_keys_merge(TBL_WINKEYS_0338E);
		((void (__far __pascal *)(char __far *, char __far *, int))track_block_copy)(TBL_SOUND_NAMES, (*(char __far **)&SND_CURRENT), 0x63);
		far_call_wrapper_1(TBL_SOUND_NAMES, 0x73, 0x28);
		disp_list_run(sample_check_active((*(char __far **)&SND_CURRENT)) ? DL_COPY_TO_RAM : DL_COPY_SOUND);
	}
}
