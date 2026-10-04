#include "mpc2kxl.h"

extern char C1_W_0D7D2[1];
extern char C2_W_014E0[1];

void __far sample_record_focus_field4(void)
{
	C2_W_SAMPLE_REC_CURSOR = 4;
	ui_field_engine(C2_W_014E0, C1_W_0D7D2);
}
