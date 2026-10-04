#include "mpc2kxl.h"

extern char C1_W_0D7D4[1];
extern char C2_W_0150A[1];

void __far sample_record_focus_field5(void)
{
	C2_W_SAMPLE_REC_CURSOR = 5;
	ui_field_engine(C2_W_0150A, C1_W_0D7D4);
}
