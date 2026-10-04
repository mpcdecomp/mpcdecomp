#include "mpc2k.h"
#include <conio.h>

void __far __fastcall port_c0_write(int a0)
{
	outp(FLASH_CTL, a0);
	W_005E = a0;
}
