#include "mpc2k.h"

struct s1 {
	char pad_0[5];
	char f_5;
};

void __far __fastcall __loadds assign_view_key_left(void)
{
	int i;

	i = ((struct s1 __far * (__near __pascal *)(int))track_calc_offset)(G_PAD_NOTE_BASE)->f_5 * 13;
	G_ASSIGN_VIEW_FIELD = TBL_ASSIGN_VIEW_FIELD_FIX[i + 156 + G_ASSIGN_VIEW_FIELD];
	assign_view_arm_field();
}
