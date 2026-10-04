#include "mpc2k.h"

void __far __pascal smem_addr_data_status(char far *p0)
{
	pad_note_release((unsigned char)p0[1]);
}
