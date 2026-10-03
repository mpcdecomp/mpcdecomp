#include "mpc2kxl.h"

void __far __fastcall __loadds sample_record_cancel(void)
{
	if (C2_W_REC_STATE == 1) {
		goto L1;
	}
	if (C2_W_REC_STATE != 2) {
		goto L2;
	}
L1:
	C2_B_REC_CANCEL_REQ = (char)1;
L2:
	return;
}
