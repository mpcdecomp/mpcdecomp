#include "mpc2k.h"

void __far X_0C236(void)
{
	disp_list_run(P_40F7);
	win_keys_merge(TBL_WINKEYS_CHANGE_DISK);
	((void (__far __pascal *)(int, int, int))install_handler)(5, W_56A8, W_56A6);
}
