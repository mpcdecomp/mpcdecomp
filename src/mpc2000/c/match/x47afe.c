#include "mpc2kxl.h"

void __far __fastcall __loadds change_disk_f4(void)
{
	change_disk_refresh();
	far_3E99C();
}
