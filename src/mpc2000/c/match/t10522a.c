#include "mpc2k.h"

void __near assign_view_arm_field(void)
{
	if (G_ASSIGN_VIEW_FIELD > 12) G_ASSIGN_VIEW_FIELD = 0;
	install_handler_15(0);
	G_ASSIGN_VIEW_FIELD = TBL_ASSIGN_VIEW_FIELD_FIX[((char __far *)track_calc_offset(G_PAD_NOTE_BASE))[5] * 13 + G_ASSIGN_VIEW_FIELD];
	((void (__near *)(void))TBL_ASSIGN_VIEW_ARM[G_ASSIGN_VIEW_FIELD])();
}
