#include "mpc2k.h"

void __far L_054E4(void)
{
	fx_type_load();
	ui_screen_enter_edit(FP_UI_RETURN_SCREEN_SEG, (*(int *)&FP_UI_RETURN_SCREEN));
}
