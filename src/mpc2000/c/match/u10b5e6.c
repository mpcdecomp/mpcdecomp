#include "mpc2k.h"

void __far __fastcall __loadds receive_mode_close(void)
{
	PAD_INPUT_MODE = PADIN_LOCAL;
	fn_0AD3A();
}
