#include "mpc2k.h"

void __far __fastcall __loadds L_052D6(int a0)
{
	if (!(char)a0) goto br_052FA;
	G_PAD_INDEX = (pad_bank_get() << 4) + (char)(a0 >> 8);
	loop_seq_handler();
	assign_view_arm_field();
br_052FA:
	;
}
