#include "mpc2k.h"

int __near fn_067C2(void)
{
	if (!SAMPLE_INPUT) goto br_067FC;
	switch (L_00106()) { case 0: goto br_067FC; }
	if (!G_SAMPLE_MODE) goto br_067E7;
	if (G_SAMPLE_MODE == SAMPLE_ST_RECORDING) goto br_067E7;
	if (G_SAMPLE_MODE != SAMPLE_ST_ARMED) goto br_067FC;
br_067E7:
	callback_set_main(0, 0);
	far_067A6();
	return 1;
br_067FC:
	return 0;
}
