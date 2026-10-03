#include "mpc2k.h"

int __far L_00106(void)
{
	return smem_word_wrapper() & 0x80 ? 0 : 1;
}
