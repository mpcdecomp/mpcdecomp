#include "mpc2k.h"

void __far __fastcall __loadds pgm_assign_enter(void)
{
	int si_;

	G_NOTE_CAPTURE = 0;
	PAD_INPUT_MODE = PADIN_ON;
	B_9D1C |= 1;
	if ((unsigned)(G_PAD_NOTE_BASE - PGM_NOTE_BASE) <= PGM_NOTE_COUNT - 1) goto br_054A0;
	G_PAD_NOTE_BASE = 0x23;
br_054A0:
	G_VELOCITY_IN = 0x7f;
	si_ = timer_io_setup(G_PAD_NOTE_BASE);
	if (si_ < 0) {
		G_PAD_INDEX = 0;
	} else {
		G_PAD_INDEX = (char)si_;
	}
	G_PGM_RETURN_PARAMS = 0;
	note_release_latched();
	win_keys_merge(TBL_WINKEYS_PGM_ASSIGN);
	assign_view_arm_field();
}
