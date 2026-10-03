#include "mpc2k.h"

void __far lcd_block_copy_7700(void)
{
	int44_wrapper(0);
	PAD_INPUT_MODE = 2;
	callback_set_main(0, 0);
	G_SAMPLE_MODE = 0;
	io_near_stub();
}
