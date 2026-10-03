#include "mpc2k.h"

void __near fn_08CAA(void)
{
	if (!(FP_LOADED_SND_SEG | FP_LOADED_SND)) goto L_08CCD;
	sample_validate_ptr(FP_LOADED_SND_SEG, FP_LOADED_SND);
	((void (__far __pascal *)(int, int))voice_release_all_if)(FP_LOADED_SND_SEG, FP_LOADED_SND);
L_08CCD:
	;
}
