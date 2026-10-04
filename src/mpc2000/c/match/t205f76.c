#include "mpc2k.h"

#define PGMS ((struct PGM __far * __near *)PGM_TABLE)

/* the program field's next and previous used program */
void __far __fastcall __loadds L_05F76(void)
{
	int i;

	for (i = (unsigned char)*WIN_FIELD_VAR + 1; i < PGM_COUNT; i++)
		if (PGMS[i]->blk_para != PGM_BLK_FREE) {
			*WIN_FIELD_VAR = i;
			WIN.change();
			return;
		}
}

void __far __fastcall __loadds L_05FBA(void)
{
	int i;

	for (i = (unsigned char)*WIN_FIELD_VAR - 1; i >= 0; i--)
		if (PGMS[i]->blk_para != PGM_BLK_FREE) {
			*WIN_FIELD_VAR = i;
			WIN.change();
			return;
		}
}
