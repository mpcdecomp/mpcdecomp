#include "mpc2k.h"

void __far __fastcall __loadds ctrl_stub_init(int a0)
{
	if (io_near_stub()) goto X_0768E;
	if (fn_067C2()) goto X_0768E;
	mpc_rate_caller();
	ctrl_port_18_write(a0);
X_0768E:
	;
}
