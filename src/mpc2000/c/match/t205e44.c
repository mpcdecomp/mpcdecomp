#include "mpc2k.h"

void __far __fastcall __loadds pgm_assign_key(void)
{
	if (PGM_CURRENT && *((unsigned __far * __near *)PGM_TABLE)[PGM_SLOT] > 2) {
		pgm_assign_enter();
		return;
	}
	G_ERRNO = 5;
	err_msg_report();
}
