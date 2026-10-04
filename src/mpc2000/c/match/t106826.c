#include "mpc2k.h"


void __far far_067A6(void)
{
	SAMPLE_INPUT = 0;
	fn_06786();
	G_SAMPLE_MODE = SAMPLE_ST_IDLE;
	REC_CURSOR = 0;
	G_ERRNO = ERR_NO_DIGITAL_CARRIER;
	err_msg_report();
}
