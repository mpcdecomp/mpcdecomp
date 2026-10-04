#include "mpc2k.h"

void __far field_edit_disable(void)
{
	win_keys_merge(TBL_WINKEYS_00C76);
	far_02DC8();
	far_02DD2();
	win_keys_merge_disable();
}
