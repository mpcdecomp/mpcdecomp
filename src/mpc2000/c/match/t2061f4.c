#include "mpc2k.h"

char __far * __far __fstrcpy(char __far *, const char __far *);
#pragma intrinsic(_fstrcpy)

void __far __fastcall __loadds seq_select_caller(void)
{
	int n;

	G_ERRNO = ERR_UNKNOWN;
	if ((n = far_059BC()) >= 0) {
		if (program_select_wrapper(n)) {
			_fstrcpy(((char __far * __near *)PGM_TABLE)[n] + 2, TBL_SOUND_NAMES);
			((struct PGM __far * __near *)PGM_TABLE)[n]->midi_pgm = COPY_PGM_TO[0];
			program_select(n);
		} else
			G_ERRNO = ERR_NO_MEMORY;
	} else
		G_ERRNO = ERR_PROG_DIR_FULL;
	if (G_ERRNO != ERR_UNKNOWN) err_msg_report();
	program_close();
}
