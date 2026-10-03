#include "mpc2kxl.h"

void __far mixer_drum_field_notify(char arg_0)
{
	int ax;

	C2_B_MIXER_DRUM = arg_0;
	fx_dsp_update_request(15, 0);
	return;
}
