#include "mpc2kxl.h"

void __far L_5193C(char arg_0)
{
	int ax;

	C2_B_MIXER_DRUM = arg_0;
	fx_dsp_update_request(15, 0);
	return;
}
