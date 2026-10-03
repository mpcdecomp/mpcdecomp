#include "mpc2k.h"

void __far __fastcall __loadds copy_pgm_do_it(void)
{
	if (G_COPY_DST_PGM == G_COPY_SRC_PGM) return;
	if (((int (__far __pascal *)(int, int))smem_access_handler_2)(G_COPY_DST_PGM, G_COPY_SRC_PGM)) {
		program_select(G_COPY_DST_PGM);
		program_close();
		return;
	}
	G_ERRNO = 1;
	err_msg_report();
}
