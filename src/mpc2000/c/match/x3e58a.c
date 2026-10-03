#include "mpc2kxl.h"

void __far __fastcall far_3E58A(int ax)
{
	C1_W_08174 = ax;
	outpw(138, ax);
	return;
}
