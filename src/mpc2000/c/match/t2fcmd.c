#include "mpc2krec.h"
/* MPC2000 SYS text2: flash board commands, each a command word written to the
 * board and, for a query, its answer read back (../2k/common/sys/text2.asm). */

int port_c0_read(void);
void __fastcall port_c0_write(int v);
void __pascal flash_write_words(unsigned long a, int far *w, int n);
void __pascal smem_read_words(unsigned long a, void far *w, int n);

struct id { int maker, device; };
struct word { int w; };

/* Bits 0-1 of port C0h are the board's Vpp and enable. */
void flash_board_idle(void)
{
	port_c0_write(port_c0_read() & ~(FLASH_CTL_VPP | FLASH_CTL_ENABLE));
}

void flash_vpp_on(void)
{
	port_c0_write(port_c0_read() | FLASH_CTL_VPP | FLASH_CTL_ENABLE);
}

void far_012E2(void)
{
	port_c0_write(port_c0_read() | FLASH_CTL_ENABLE);
}

void far_012F0(void)
{
	flash_board_idle();
	far_012E2();
}

struct id __pascal flash_read_identifier(unsigned long a)
{
	int c;
	struct id r;

	c = FLASH_CMD_READ_ID;
	flash_write_words(a, &c, 1);
	smem_read_words(a, &r, 2);
	return r;
}

struct word __pascal mem_op_wrapper_2(unsigned long a)
{
	int c;
	struct word r;

	c = FLASH_CMD_READ_STATUS;
	flash_write_words(a, &c, 1);
	smem_read_words(a, &r, 1);
	return r;
}

