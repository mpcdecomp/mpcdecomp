#include "mpc2kxl.h"

long __far __fastcall __loadds sound_spec_open(void)
{
	return (*(long (far *)())(*(long *)&C2_W_08D2E))();
}
