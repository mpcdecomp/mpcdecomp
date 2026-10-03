#include "mpc2kxl.h"

void __far fx_section_field_notify(void)
{
	((void (__far *)(char, char))fx_dsp_update_request)((char)(1 << C0_B_0D7C7), C2_B_09606);
}
