#include "mpc2kxl.h"

void __far __fastcall __loadds sample_record_cancel(void)
{
	if (C2_W_REC_STATE == 1) goto L_4814A;
	if (C2_W_REC_STATE != 2) goto br_48AAD;
L_4814A:
	C2_B_REC_CANCEL_REQ = 1;
br_48AAD:
	;
}
