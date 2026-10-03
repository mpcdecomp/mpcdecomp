#include "mpc2k.h"

void __far __fastcall __loadds X_0AF30(void)
{
	if (SDS_STATE & 7) goto X_0AF4A;
	string_scan_sysex(SDS_EXCL_CH, SDS_REQUEST_NUM);
X_0AF4A:
	;
}
