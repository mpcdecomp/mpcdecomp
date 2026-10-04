#include "mpc2kxl.h"

extern char C2_W_01196[1];

void __far tgt_47AC4(void)
{
	handler_set_install(C2_W_01196);
	disp_request_flush();
}
