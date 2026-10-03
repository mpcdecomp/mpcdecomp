#include "mpc2kxl.h"

void __far fx_dsp_reload_all(void)
{
	far_5545E();
	far_556E0(0);
	far_556E0(1);
	far_5575E(2);
	far_5575E(3);
}
