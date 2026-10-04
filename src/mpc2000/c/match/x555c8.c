#include "mpc2kxl.h"

void __far fx_dsp_update_request(char p0, char p1)
{
	C2_B_FX_UPDATE_MASK = p0;
	P_8DC3 = p1;
	if (!p1) goto br_555E0;
	C2_B_FX_UPDATE_MASK |= 0x80;
br_555E0:
	;
}
