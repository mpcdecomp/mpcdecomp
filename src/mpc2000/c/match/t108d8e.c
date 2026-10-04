#include "mpc2k.h"

void __far __fastcall __loadds L_08D0E(void)
{
	rep_memcpy_handler(W_509E, W_509C, FP_LOADED_SND_SEG, FP_LOADED_SND);
	sample_validate_ptr(W_509E, W_509C);
	fn_08C4C();
}
