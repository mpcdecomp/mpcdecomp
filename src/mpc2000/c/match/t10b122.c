#include "mpc2k.h"

struct pool { long base; long len; int next; };

int __near __pascal lcd_clear_buffer(unsigned char far *p)
{
	unsigned long period;
	long loop_start;

	sample_desc_init(P_8CF2);
	period = (unsigned long)p[9] << 14 | (unsigned)(p[8] << 7 | p[7]);
	loop_start = (unsigned long)p[15] << 14 | (unsigned)(p[14] << 7 | p[13]);
	W_8D06 = 0;
	SDS_LOOP_END = (unsigned long)p[18] << 14 | (unsigned)(p[17] << 7 | p[16]);
	SDS_SAMPLE_LEN = (unsigned long)p[12] << 14 | (unsigned)(p[11] << 7 | p[10]);
	if (p[19] == 0x7f) SDS_LOOP_ON = 0; else SDS_LOOP_ON = 1;
	SDS_LOOP_LEN = SDS_LOOP_END - loop_start;
	if (SDS_LOOP_LEN < 0) SDS_LOOP_LEN = 0;
	if (SDS_LOOP_ON) SDS_LOOP_END = SDS_SAMPLE_LEN;
	SDS_SAMPLE_RATE = 1000000000UL / period;
	if (p[6] >= 15) SDS_PKT_WORDS = 40; else SDS_PKT_WORDS = 60;
	SDS_PACKET_COUNT = (SDS_SAMPLE_LEN + SDS_PKT_WORDS - 1) / SDS_PKT_WORDS;
	if (mem_io_handler(&SDS_RX_SND_SLOT, SDS_SAMPLE_LEN, 0)) {
		SDS_RX_ADDR = ((struct pool *)SMEM_POOL)[SDS_RX_SND_SLOT].base;
		return 1;
	}
	return 0;
}
