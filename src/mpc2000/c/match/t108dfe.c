#include "mpc2k.h"

void __far __fastcall __loadds L_08D7E(void)
{
	((void (__far __pascal *)(int, int))voice_release_all_if)(FP_LOADED_SND_SEG, FP_LOADED_SND);
	PAD_INPUT_MODE = PADIN_LOCAL;
	fn_08CAA();
}
