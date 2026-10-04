#include "mpc2kxl.h"

extern char P_64BC[1];

void __near fn_3DA24(void)
{
	handler_set_install(P_64BC);
}
