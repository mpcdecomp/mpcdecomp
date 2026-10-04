/* MPC2000 SYS text2: the CHANGE DISK window. */

#include "mpc2k.h"

typedef void (far *fn)(void);

void __fastcall __loadds change_disk_refresh(void)
{
	far_0C228();
}

void __fastcall __loadds change_disk_paint(void)
{
	disp_list_run(DL_CHANGE_DISK);
	((void (__far __pascal *)(char, char, char __far *))cmd_caller_setup)(0x48, 0x14, ((char *)P_4E74));
}

void __fastcall __loadds change_disk_do_it(void)
{
	switch (sample_load_step()) {
	case 1:
		X_0C236();
		return;
	case 2:
		if (B_56C0) {
			((void (__far __pascal *)(char __far *))ui_enter_pad_assign)(W_50A0);
			install_handler(WIN_K_F4, (*(void (__far **)(void))&W_56A6));
			return;
		}
		midi_prog_change();
		install_handler(WIN_K_REFRESH, win_key_nop_stub);
	case 0:
		int43_wrapper(5);
	}
}
