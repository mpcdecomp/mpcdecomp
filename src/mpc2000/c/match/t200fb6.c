#include "mpc2k.h"
#include <conio.h>

void __far __fastcall port_c2_write(int a0)
{
	outp(PORT_C2, a0);
	G_PORT_C2_SHADOW = a0;
}
