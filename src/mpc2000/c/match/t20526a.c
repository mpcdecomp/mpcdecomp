#include "mpc2k.h"

void __far L_053BA(void)
{
	fx_type_load();
	audio_dispatch_table(FP_UI_RETURN_SCREEN_SEG, (*(int *)&FP_UI_RETURN_SCREEN));
}
