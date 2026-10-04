#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C2_W_01462[1];

void __far sample_record_focus_field1(void)
{
	C2_W_SAMPLE_REC_CURSOR = 1;
	C0_B_098B8[0] = C2_B_REC_MODE;
	ui_field_engine(C2_W_01462, C0_B_098B8);
}
