#include "mpc2k.h"

int __far smem_ctrl_setup_1(void)
{
	char __far *p;
	int i;
	int c;

	c = (char)B_9D5A[0];
	if (!bcd_display_calc((long)(int __far *)&c, 2)) return 0;
	for (i = 0; i < 0x18; i++) {
		p = ((char __far **)PGM_TABLE)[i];
		if (*(unsigned __far *)p > 2) {
			if (!bcd_display_calc((long)(int __far *)&i, 2)) return 0;
			if (!pgm_file_write((long)p)) return 0;
		}
	}
	return 1;
}
