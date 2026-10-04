#include "mpc2k.h"

void __near fn_08C4C(void)
{
	*(struct SND __far **)&W_509C = sample_data_load_2(*(char __far **)&FP_LOADED_SND);
	if (*(struct SND __far **)&W_509C) {
		X_08D48();
		return;
	}
	if ((unsigned)(G_PAD_NOTE_BASE - PGM_NOTE_BASE) <= PGM_NOTE_COUNT - 1)
		PGM_CURRENT->pad[G_PAD_NOTE_BASE - 0x23].snd = *(struct SND __far **)&FP_LOADED_SND;
	*(long *)&FP_LOADED_SND = 0;
	int43_wrapper(5);
}
