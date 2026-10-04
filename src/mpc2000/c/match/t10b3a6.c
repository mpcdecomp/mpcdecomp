#include "mpc2k.h"

void __far __fastcall __loadds smem_data_read_handler(void)
{
	struct SND __far *p;

	voice_release_all();
	if (sample_data_load_2(P_5140)) {
		G_ERRNO = ERR_NAME_IN_USE;
		err_msg_report();
		ui_sound_dialog_draw(0);
		return;
	}
	if (!(p = sample_pool_add(*(struct SND *)P_5140))) {
		G_ERRNO = ERR_SOUND_DIR_FULL;
		err_msg_report();
		return;
	}
	if (PGM_NOTE_OK(G_PAD_NOTE_BASE))
		PGM_CURRENT->pad[G_PAD_NOTE_BASE - PGM_NOTE_BASE].snd = p;
	SND_CURRENT = p;
	fn_0B642();
}
