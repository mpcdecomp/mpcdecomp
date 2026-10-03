#include "mpc2k.h"

void __far * __cdecl _fmemcpy(void __far *, const void __far *, unsigned);
#pragma intrinsic(_fmemcpy)

void __far __fastcall __loadds smem_rep_str(void)
{
	_fmemcpy(P_1DD3[0] ? (char __far *)P_8F78 : (char __far *)PGM_CURRENT + 0x8de, P_1D76, 64);
	pgm_assign_enter();
}
