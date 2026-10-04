#include "mpc2krec.h"
struct s2 { char b[2]; };
struct s2 __far __pascal mem_op_wrapper_2(unsigned long);
void __far __pascal io_delay_wait(unsigned long);
void __far __pascal flash_write_words(unsigned long, int __far *, int);
int __far port_c0_read(void);
void __far __fastcall port_c0_write(int);

int __far __pascal io_delay_wait2(unsigned long a)
{
	volatile int st;
	int v;

	do
		*(struct s2 *)&st = mem_op_wrapper_2(a);
	while (!(st & FLASH_SR_READY));
	io_delay_wait(a);
	port_c0_write(port_c0_read() & ~FLASH_CTL_VPP | FLASH_CTL_ENABLE);
	if (!(st & FLASH_SR_ERRORS)) return 1;
	if (st & FLASH_SR_ERASE_ERR && st & FLASH_SR_PROGRAM_ERR) {
		v = FLASH_CMD_CLEAR_STATUS;
		flash_write_words(a, &v, 1);
	}
	return 0;
}
