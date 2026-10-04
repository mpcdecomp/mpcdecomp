#include "mpc2kxl.h"

extern char P_64DA[1];

void __near fn_3DA32(void)
{
	handler_set_install(P_64DA);
}
