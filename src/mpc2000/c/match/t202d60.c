#include "mpc2k.h"

void __far win_keys_merge_disable(void)
{
	win_keys_merge(TBL_WINKEYS_00CA6);
}
