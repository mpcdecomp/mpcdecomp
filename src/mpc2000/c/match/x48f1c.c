#include "mpc2kxl.h"

extern char C1_W_0D7D0[1];
extern char C2_W_014B6[1];

void __far sample_record_focus_field3(void)
{
	C2_W_SAMPLE_REC_CURSOR = 3;
	ui_field_engine(C2_W_014B6, C1_W_0D7D0);
}
