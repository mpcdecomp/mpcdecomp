#include "mpc2k.h"

void __near X_08CE6(void)
{
	win_keys_merge(TBL_WINKEYS_RENAME_FILE);
	((void (__far __pascal *)(int, int, int, int))far_call_wrapper_1)(FP_LOADED_SND_SEG, FP_LOADED_SND, 0x71, 0x13);
}
