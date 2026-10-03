#include "mpc2k.h"

#pragma intrinsic(memset)

void __near fn_06786(void)
{
	fn_06EF2();
	memset(BUF_XFER, 0, 0x800);
	switch (dma_06F0C()) { case 0: goto br_067A3; }
	smem_audio_init();
	dac_out_program();
br_067A3:
	;
}
