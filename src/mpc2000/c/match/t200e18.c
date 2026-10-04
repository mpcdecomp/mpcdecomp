#include "mpc2k.h"

#pragma intrinsic(memset)

void __far string_copy_cmd(void)
{
	int bx_;

	SMEM_POOL_USED = 0x82;
	memset(((char *)SMEM_POOL), 0, 0x51e);
	bx_ = 0;
	SMEM_POOL_FREE = bx_;
loop_00E5D:
	*(int __near *)(char __near *)((char *)SMEM_POOL_NEXT + bx_ * 10) = bx_ + 1;
	bx_++;
	if (bx_ < 0x82) goto loop_00E5D;
	SMEM_POOL_TAIL_NEXT = 0x82;
}
