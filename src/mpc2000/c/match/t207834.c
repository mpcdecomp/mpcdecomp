#include "mpc2k.h"

void __far X_07C12(void)
{
	sample_data_load_3((void (far *)(void))fdc_port_90_access);
}
