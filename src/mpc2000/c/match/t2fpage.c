/* MPC2000 SYS text2: flash board page-buffer commands (../2k/common/sys/text2.asm). */

#include "mpc2k.h"

void __pascal io_delay_wait(unsigned long a)
{
	int c;

	c = FLASH_CMD_READ_ARRAY;
	flash_write_words(a, &c, 1);
}

void __pascal mem_op_wrapper_4(unsigned long a, int far *w, int n)
{
	int c[3];

	c[0] = FLASH_CMD_PAGE_WRITE;
	c[1] = n - 1;
	c[2] = 0;
	flash_write_words(a, c, 3);
	flash_write_words(a, w, n);
}

void __pascal mem_op_wrapper_5(unsigned long a, int n)
{
	int c[3];

	c[0] = FLASH_CMD_PAGE_COMMIT;
	c[1] = n - 1;
	c[2] = 0;
	flash_write_words(a, c, 2);
	flash_write_words(a, &c[2], 1);
}
